from exts import db
from .functions import file_put_contents,file_get_contents
import datetime,os,time,re
from flask import make_response
import mimetypes
class Baksql(object):
    def __init__(self,save_path=""):
        super(Baksql,self).__init__()
        self.s = db.session()
        self.save_path = save_path
        self.baksql_name = datetime.datetime.now().strftime("%Y%m%d%H%M%S")+".sql"
        self.begtime = time.time()

    def query(self,sql):
        '''
        查询
        :param sql:
        :return:
        '''
        res = self.s.execute(sql).fetchall()
        self.s.close()
        return res

    def get_dbname(self):
        '''
        获取全部表
        :return:
        '''
        sql = 'SHOW TABLES'
        list = self.query(sql)
        table = []
        for v in list:
            table.append(v[0])
        return table

    def get_dbhead(self,table = ''):
        '''
        获取表定义语句
        :return:
        '''
        sql = "SHOW CREATE TABLE `"+table+"`"
        ddl = self.query(sql)[0][1]+";"
        return ddl
    def get_dbdata(self,table = ''):
        '''
        获取表数据
        :return:
        '''
        sql = "SHOW COLUMNS FROM `"+table+"`"
        list = self.query(sql)
        # 字段
        columns = ''
        # 需要返回的SQL
        query = ''
        for v in list:
            columns += "`" +str(v[0])+"`,"
        columns = columns[0:len(columns) - 1]
        data = self.query("SELECT * FROM "+table)
        for value in data:
            dataSql = ""
            for value_ in value:
                dataSql += "'"+str(value_)+ "',"
            dataSql = dataSql[0:len(dataSql) - 1]
            query += "INSERT INTO `" + table + "`("+ columns + ")  VALUES (" + dataSql +");\r\n"
        return query

    def writeToFile(self,tables=[],ddl=[],data=[]):
        '''
        写入文件
        :param tables:
        :param ddl:
        :param data:
        :return:
        '''
        string = "/*\r\nMySQL Database Backup Tools\r\n"
        string += "Data:" + datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S") + "\r\n*/\r\n"
        string += "SET FOREIGN_KEY_CHECKS=0;\r\n"
        i = 0
        for table in tables:
            string += "-- ----------------------------\r\n"
            string += "-- Table structure for "+table+"\r\n"
            string += "-- ----------------------------\r\n"
            string += "DROP TABLE IF EXISTS `"+table+"`"+";\r\n"
            string += ddl[i]+"\r\n"
            string += "-- ----------------------------\r\n"
            string += "-- Records of "+table+"\r\n"
            string += "-- ----------------------------\r\n"
            string += data[i]+"\r\n"
            i += 1
        if os.path.exists(self.save_path) == False:
            os.makedirs(self.save_path)
        save_path = os.path.join(self.save_path,self.baksql_name)
        file_put_contents(save_path,string)
        if os.path.exists(save_path):
            backtime = str(round(time.time() - self.begtime,3))
            msg = "备份成功!花费时间 "+ backtime +"秒"
            return msg
        else:
            return "备份失败"

    def setTables(self,tables=[]):
        '''
        设置要备份的表
        :param tables:
        :return:
        '''
        if tables is not None and len(tables) > 0:
            self.tables = tables
        else:
            self.tables = self.get_dbname()

    def backup(self,tables=[]):
        '''
        备份
        :param tables:
        :return:
        '''
        ddl = []
        data = []
        self.setTables(tables)
        if (len(self.tables) > 0):
            for table in self.tables:
                ddl.append(self.get_dbhead(table))
                data.append(self.get_dbdata(table))
            return self.writeToFile(self.tables,ddl,data)
        else:
            self.error = '数据库中没有表!'
            return False

    def get_error(self):
        '''
        获取错误
        :return:
        '''
        return self.error

    def restore(self,filename=""):
        '''
        还原
        :param filename:
        :return:
        '''
        path = os.path.join(self.save_path,filename)
        if os.path.exists(path) == False:
            self.error = 'SQL文件不存在!'
            return False
        else:
            sql = self.parseSQL(path)
            try:
                print(sql)
                sql ="SET FOREIGN_KEY_CHECKS=0;DROP TABLE IF EXISTS `alembic_version`;CREATE TABLE `alembic_version` (  `version_num` varchar(32) NOT NULL,  PRIMARY KEY (`version_num`)) ENGINE=MyISAM DEFAULT CHARSET=utf8;INSERT INTO `alembic_version` (`version_num`)  VALUES ('cf66c13e272b');"

                print(self.s.execute(sql))
                msg = '还原成功!花费时间'+str(time.time() - self.begtime)
                return msg
            except Exception as e:
                self.error = str(e)
                print(str(e))
                return False

    def parseSQL(self,path):
        '''
        解析SQL文件为SQL语句数组
        :param path:
        :return:
        '''
        sql = file_get_contents(path=path)

        sql = sql.replace('\n','\r\n')
        sql = sql.split('\r\n')
        sql = filter(lambda after_sql: re.match(re.compile(r'^--.*'),after_sql) is None,sql)
        sql = "".join(list(sql))
        sql = re.sub(re.compile(r'\/\*.*\*\/'),"",sql)
        return sql

    def downloadFile(self,filename=""):
        path= os.path.join(self.save_path, filename)
        if os.path.exists(path):
            content = file_get_contents(path)
            response = make_response(content)
            mime_type = mimetypes.guess_type(filename)[0]
            response.headers['Cache-Control'] = "must-revalidate, post-check=0, pre-check=0"
            response.headers['Content-Description'] = "File Transfer"
            response.headers['Content-Type'] = mime_type
            # response.headers['Content-Length'] = file_size
            response.headers['Content-Disposition'] = 'attachment; filename={}'.format(filename.encode().decode('latin-1'))
            return response
        else:
            self.error = "文件有错误!"
            return False

    def getfiletime(self,filename):
         '''
         返回文件修改时间
         :param filename:
         :return:
         '''
         path = os.path.join(self.save_path, filename)
         t = os.path.getmtime(path)
         t = time.localtime(t)
         return time.strftime("%Y-%m-%d %H:%M:%S",t)

    def getfilesize(self,filename):
        '''
        获取文件是大小
        :param filename:
        :return:
        '''
        size = os.path.getsize(os.path.join(self.save_path,filename))
        a = ['B', 'KB', 'MB', 'GB', 'TB']
        pos = 0
        while(size > 1024):
            size /= 1024
            pos =+ pos
        return str(round(size,2)) + a[pos]

    def get_filelist(self,Order = 0):
        '''
        获取文件列表
        :param Order:
        :return:
        '''
        FilePath = self.save_path
        if os.path.exists(FilePath):
            FilePath = os.listdir(FilePath)
            FileAndFolderAyy = []
            for v in FilePath:
                if v != "." and v != "..":
                    data = {}
                    data['file_name'] = v
                    data['file_size'] = self.getfilesize(v)
                    data['file_time'] = self.getfiletime(v)
                    FileAndFolderAyy.append(data)
            return FileAndFolderAyy
        else:
            raise ValueError('文件夹不存在！')

    def delfilename(self,filename):
        path = os.path.join(self.save_path, filename)
        os.remove(path)
        return '删除成功'










