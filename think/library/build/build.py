from .config import build
from think import functions as f
import os,sys
class Build(object):
    '''
    根据传入的build资料创建目录和文件
    @access protected
    @param  array  build build列表
    @return void
    '''
    def run(self,build=build):
        #锁定
        lock = os.path.join(os.path.dirname(os.path.abspath("__file__")),'build.lock')
        self.root_path=os.path.dirname(os.path.abspath("__file__"))
        if f.is_writeable(lock) == False:
            if f.touch(lock) == False:
                raise Exception('应用目录[' + lock + ']不可写，目录无法自动生成！<BR>请手动生成项目目录~')
        # 配置文件
        self.buildconfig(os.path.join(self.root_path,'config.py'))
        # 数据库链接
        self.buildexts(os.path.join(self.root_path, 'exts.py'))
        # 管理文件
        self.buildmanage(os.path.join(self.root_path, 'manage.py'))
        for i in build:
            # 创建主目录
            self.appname = i
            self.buildapp(i);
            for v in build[i]:
                for vv in v:
                    if vv == 'dir':
                        # 创建目录
                        self.builddir(v[vv])
                    elif vv == 'file':
                        # 创建文件
                        self.buildfile(v[vv])
                    else:
                        # 创建模块
                        self.module(vv,v[vv])
        self.buildHello('home')
        self.check_conf_ext_db()
        os.remove(lock)
        # return '创建目录成功！'

    def buildapp(self,path):
        '''
        :param path:  路径
        :return:
        '''
        if os.path.exists(path) == False:
            os.mkdir(path);
        self.apppath = path
        pass

    def builddir(self,list):
        '''
            创建目录
            :return:
        '''
        for v in list:
            v = os.path.join(self.apppath,v)
            if os.path.exists(v) == False:
                os.mkdir(v);


    def buildfile(self,list):
        '''
        创建文件
        :param list: 文件列表
        :return:
        '''
        for v in list:
            v = os.path.join(self.apppath, v)
            if os.path.exists(os.path.dirname(v)) == False:
                os.mkdir(os.path.dirname(v));
            if os.path.exists(v) == False:
                f.file_put_contents(v,'')
                pass


    def module(self,module,list):
        '''
        创建模块
        :param model:模块名称
        :param list:build 列表
        :return:
        '''
        module if module else ''
        modulepath = os.path.join(self.apppath,module)
        if os.path.exists(modulepath) == False:
            os.mkdir(modulepath);
        self.buildCommon(module)
        if list is None:
            list = {
                'file':['config.php', 'common.php'],
                'dir':['controller', 'model', 'view'],
            }
        for v in list:
            if 'dir' == v:
                for vv in list[v]:
                    self.checkDirBuild(os.path.join(modulepath,vv))
            elif 'file' == v:
                for vv in list[v]:
                    if os.path.exists(os.path.join(modulepath,vv)) == False:
                        f.file_put_contents(os.path.join(modulepath,vv), '')
            else:
                # 生成mvc
                for vv in list[v]:
                    vv = vv.strip()
                    filename = os.path.join(modulepath,v,''.join([vv,'.py']))
                    if v == 'controller':
                        # if module == 'home':
                        #     content = "from flask import Blueprint,render_template\n\nbp = Blueprint('{}',__name__)" \
                        #               "\n\n@bp.route('/')\ndef index():\n    return render_template('{}/{}/index.html')".format(
                        #         module,module, vv)
                        # else:
                        content = "from flask import Blueprint,render_template\n\nbp = Blueprint('{}',__name__,url_prefix='/{}/{}')" \
                                  "\n\n@bp.route('/')\ndef index():\n    return render_template('{}/{}/index.html')".format(
                            module+vv, module, vv, module, vv)
                    elif v == 'model':
                        content = "from exts import db\n"
                    elif v == 'form':
                        content = "from wtforms import StringField,IntegerField\nfrom ..common import FormBase\n" \
                                  "from wtforms.validators " \
                                  "import email,InputRequired,Length,EqualTo,ValidationError\n\n" \
                                  "class {}Form(FormBase):\n    pass".format(vv.capitalize())
                    elif v == 'templates':
                        filename = os.path.join(v,module,''.join([vv,'.html']))
                        tmp = self.root_path
                        for d in os.path.dirname(filename).split('\\'):
                            d = os.path.join(tmp, d)
                            tmp = d
                            self.checkDirBuild(d)
                        content = '';
                    elif v == 'static':
                        filename = os.path.join(v,module,''.join([vv]))
                        tmp = self.root_path
                        for d in os.path.dirname(filename).split('\\'):
                            d = os.path.join(tmp, d)
                            tmp = d
                            self.checkDirBuild(d)
                        content = '';
                    else:
                        content = ''
                    if os.path.exists(filename) == False:
                        if v == 'controller':
                            import_str1 = 'from '+'.'.join([self.appname, module, v, vv, ]) + ' import bp as ' + module + vv + 'bp'
                            import_str2 =  'app.register_blueprint({})'.format(module+vv + 'bp')
                            self.addformimport(import_str1,import_str2)
                        f.file_put_contents(filename, content);

    def buildHello(self,module):
        filename = os.path.join(self.apppath,module,'controller','index.py')
        if os.path.exists(filename) == False:
            # if module == 'home':
            #     content = "from flask import Blueprint,render_template\n\nbp = Blueprint('{}',__name__)" \
            #           "\n\n@bp.route('/')\ndef index():\n    return render_template('{}/index/index.html')".format(module,module)
            # else:
            content = "from flask import Blueprint,render_template\n\nbp = Blueprint('{}',__name__)" \
                          "\n\n@bp.route('/')\ndef index():\n    return '<h1 style=\"margin=200px,auto\">欢迎来到thinkpy</h1>'".format('home'+'index')
            dirpath = os.path.dirname(filename)
            tmp = self.root_path
            for d in dirpath.split('\\'):
                d = os.path.join(tmp,d)
                tmp = d
                self.checkDirBuild(d)
            import_str1 = 'from ' + '.'.join([self.appname, module,'controller','index' ]) + ' import bp as ' + module + 'indexbp'
            import_str2 = 'app.register_blueprint({})'.format(module + 'indexbp')
            self.addformimport(import_str1, import_str2)
            f.file_put_contents(filename, content)

    def buildCommon(self,module):
        '''
        创建公用文件
        :param module: 模块名
        :return:
        '''
        config = os.path.join(self.apppath,module,'config.py')
        self.checkDirBuild(os.path.dirname(config));
        if os.path.exists(config) == False:
            f.file_put_contents(config,"# 配置文件 \n")
        common = os.path.join(self.apppath,module,'common.py')
        if os.path.exists(common) == False:
            content = "# 公用函数文件 \nfrom wtforms import Form\nclass FormBase(Form):    " \
                      "\n    def get_err_one(self):\n        err = self.errors.popitem()[1][0]\n        return err"
            f.file_put_contents(common, content)

    def checkDirBuild(self,path):
        '''
        创建目录
        目录名称
        :param path:
        :return:
        '''
        if os.path.exists(path) == False:
            os.mkdir(path)

    def buildconfig(self,path):
        '''
        构建配置文件
        :param path:
        :return:
        '''
        if os.path.exists(path) == False:
            content = "import os" \
                      "\nDEBUG       = False" \
                      "\nSECRET_KEY  = os.urandom(24)" \
                      "\nDIALECT     = 'mysql'" \
                      "\nDRIVER      = 'pymysql'" \
                      "\nUSERNAME    = 'root'" \
                      "\nPASSWORD    = ''" \
                      "\nHOST        = '127.0.0.1'" \
                      "\nPORT        = '3306'" \
                      "\nDARABSE     = 'demo'" \
                      "\nSQLALCHEMY_DATABASE_URI = '{}+{}://{}:{}@{}:{}/{}?charset=utf8'" \
                      ".format(DIALECT,DRIVER,USERNAME,PASSWORD,HOST,PORT,DARABSE)" \
                      "\nSQLALCHEMY_TRACK_MODIFICATIONS = False"
            f.file_put_contents(path, content)

    def buildexts(self, path):
        '''
        构建数据库链接
        :param path:
        :return:
        '''
        if os.path.exists(path) == False:
            content = "from flask_sqlalchemy import SQLAlchemy\ndb = SQLAlchemy()"
            f.file_put_contents(path, content)

    def buildmanage(self,path):
        '''
            构建管理文件
        :param path:
        :return:
        '''
        if os.path.exists(path) == False:
            content = "from flask_script import Manager\n" \
                      "from flask_migrate import Migrate,MigrateCommand\n" \
                      "from think.library.build import Build\n" \
                      "from exts import db\n" \
                      "from app import app\n" \
                      "\n\nmanger = Manager(app)           ###管理" \
                      "\nmigrate = Migrate(app,db)       ###数据库映射" \
                      "\nmanger.add_command('mg',MigrateCommand)" \
                      "\n@manger.command" \
                      "\ndef build():" \
                      "\n    b = Build().run()" \
                      "\n    print('创建成功')" \
                      "\n\nif __name__ == '__main__':" \
                      "\n    manger.run()"
            f.file_put_contents(path, content)

    def addformimport(self,str1,str2):
        '''
        增加主程序文件引入
        :param str1:
        :return:
        '''
        apppath = os.path.join(self.root_path,'app.py')
        try:
            file = open(apppath, "r",encoding='utf8')
            content = file.read()
            # 插入引导文件
            content_add1  = '\n' + str1
            content_add2 = '\n' + str2
            # 这是查找内容
            find1 = 'from flask import Flask'
            find2 = "app = Flask(__name__)"

            # 这个条件表示还没有导入
            if content.find(str1) == -1:
                pos1 = content.find(find1)
                if pos1 != -1:
                    pos1 += len(find1)
                    content = content[:pos1] + content_add1 + content[pos1:]
                    pos2 = content.find(find2)
                    if pos2 != -1:
                        pos2 += len(find2)
                        content = content[:pos2] + content_add2 + content[pos2:]
                    file = open(apppath, "w",encoding='utf8')
                    file.write(content)
            file.close()
        except Exception as e:
            print(e)

    def check_conf_ext_db(self):
        '''
        插入到导入文件之下
        :return:
        '''
        apppath = os.path.join(self.root_path, 'app.py')
        try:
            file = open(apppath, "r",encoding='utf8')
            content = file.read()
            # 这是查找内容
            find1 = 'from flask import Flask'
            find2 = "app = Flask(__name__)"
            find3 = "from exts import db"
            find4 = "import config"
            find5 = "if __name__ == '__main__':"
            find6 = "db.init_app(app)"
            find7 = "app.config.from_object(config)"
            find8 = "from think.library.build import Build"
            find9 = "Build().run()"

            # 这个条件表示还没有导入
            pos1 = content.find(find1)
            if pos1 != -1:
                # 文件没有导入db链接文件
                if content.find(find3) == -1:
                    pos1 += len(find1)
                    content = content[:pos1] + "\nfrom exts import db" + content[pos1:]
                if content.find(find4) == -1:
                    pos1 = content.find(find1)
                    pos1 += len(find1)
                    content = content[:pos1] + "\nimport config" + content[pos1:]
                if content.find(find6) == -1:
                    pos1 = content.find(find5)
                    if pos1 != -1:
                        content = content[:pos1] + "db.init_app(app)\n" + content[pos1:]
                if content.find(find7) == -1:
                    pos2 = content.find(find2)
                    pos2 += len(find2)
                    content = content[:pos2] + "\napp.config.from_object(config)" + content[pos2:]
                # 注释创建
                pos8 = content.find(find8)
                if pos8 != -1:
                    content = content[:pos8] + "# " + content[pos8:]
                pos9 = content.find(find9)
                if pos9 != -1:
                    content = content[:pos9] + "# " + content[pos9:]
                file = open(apppath, "w",encoding='utf8')
                file.write(content)
            file.close()
        except Exception as e:
            print(e)