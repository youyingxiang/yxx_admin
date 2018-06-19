# 公用函数文件 
from wtforms import Form
from .model.log import Log
from flask import request,session
from config import ADMIN_SESSION_ID
from exts import db
import time,os

class FormBase(Form):    
    def get_err_one(self):
        err = self.errors.popitem()[1][0]
        return err

def get_str_upper(oriStr,splitStr):
    '''
    首字母大写 下划线后面第一个大写
    :param oriStr:字符串
    :param splitStr:分割符号比如 "_"
    :return:
    '''
    str_list = oriStr.split(splitStr)
    if len(str_list) > 1:
        str_list[0] = str_list[0][0].upper() + str_list[0][1:]
        for index in range(1, len(str_list)):
            if str_list[index] != '':
                str_list[index] = str_list[index][0].upper() + str_list[index][1:]
            else:
                continue
        return ''.join(str_list)
    else:
        oriStr = oriStr[0].upper() + oriStr[1:]
        return oriStr

def write_log(log_type,log_detail):
    '''
    写日志
    :param log_info:
    :return:
    '''
    l = Log(
        log_type = log_type,
        ip = request.remote_addr,
        log_detail = log_detail,
        admin_id = session.get(ADMIN_SESSION_ID),
        # admin_id = 1,
        create_time = time.time()
    )
    db.session.add(l)
    db.session.commit()

def is_login():
    if session.get(ADMIN_SESSION_ID) is None:
        return False
    else:
        return True

def checkDirBuild(rootpath,path):
    for v in path.split(os.sep):
        v = os.path.join(rootpath, v)
        rootpath = v
        if os.path.exists(v) == False:
            os.mkdir(v)

def reSort(data,parent=0,level=0,ret = []):
    '''
    递归
    :return:
    '''
    for v in data:
        if v.parent == parent:
            v.level = level
            ret.append(v)
            reSort(data,v.id,level+1,ret)
    return ret

def getChildren(data,id = 0,ret = []):
    for v in data:
        if v.parent == id:
            ret.append(v.id)
            getChildren(data,v.id,ret)
    return ret
