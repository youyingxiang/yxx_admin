from flask import Blueprint,render_template,session
from ..model.log import Log
import psutil
bp = Blueprint('adminindex',__name__,url_prefix='/admin/index')

@bp.route('/index/')
def index():
    #系统内存使用情况
    svemm = get_virtual_memory()
    logins = get_login_info()
    return  render_template('/admin/index/index.html',svemm=svemm,logins=logins)

#打印本机的内存信息
def get_virtual_memory():
    svemm = psutil.virtual_memory()
    svemm = map(lambda data:round(data/1024/1024/1024,2) if data>100 else data,svemm)
    return list(svemm)

def get_login_info():
    '''
    登录信息
    :return:
    '''
    logins = Log.query.filter(Log.log_type=="login").order_by(Log.id.desc()).limit(8).offset(0).all()
    return logins