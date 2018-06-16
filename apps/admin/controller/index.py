from flask import Blueprint,render_template,session
from ..model.log import Log
from ..model.posts import Posts
from exts import cache
from think import restful
import psutil,urllib.request,platform
bp = Blueprint('adminindex',__name__,url_prefix='/admin/index')


@bp.route('/index/')
def index():
    #系统内存使用情况
    svemm = get_virtual_memory()
    logins = get_login_info()
    sysinfo = get_sys_info()
    posts_new = get_posts_info()
    return  render_template('/admin/index/index.html',svemm=svemm,logins=logins,sysinfo=sysinfo,posts_new=posts_new)

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
    logins = Log.query.filter(Log.log_type=="login").order_by(Log.id.desc()).limit(9).offset(0).all()
    return logins


def get_sys_info():
    '''
    获取系统信息
    :return:
    '''
    sysinfo = {}
    sysinfo['系统cpu位数'] = platform.processor()
    sysinfo['操作系统类型'] = platform.platform()
    sysinfo['系统主机名'] = platform.node()
    sysinfo['python版本'] = platform.python_version()
    return sysinfo

def get_posts_info():
    p = Posts.query.filter(Posts.post_status == 1).order_by("id desc").limit(10).offset(0).all()
    return p

@bp.route('/clear_cache/',methods=['POST'])
def clear_cache():
    cache.clear()
    return restful.success('删除成功！')
