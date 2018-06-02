from flask import Blueprint,render_template,request
from ..common import is_login,checkDirBuild
from apps.admin.model.config_field import ConfigField
from think import restful
import os
bp = Blueprint('adminupload',__name__,url_prefix='/admin/upload')

def __init__():
    print('3')


@bp.route('/upload')
def upload():
    # if is_login() == False:
    #     return restful.unauth_error(message="用户没有登录!没有上传权限")
    up_load_type = request.args.get('dir')
    if up_load_type is None:
        return restful.params_error(message="请指定上传类型")
    up_conf_data = ConfigField.query.filter(ConfigField.state == 1).all()
    up_k_v = {}
    for v in up_conf_data:
        up_k_v[v.k] = v.v
    basepath = os.path.abspath(os.path.join(os.path.dirname(__file__),'..','..','..'))
    file_move_path = os.path.join(basepath,up_k_v['upload_path'],up_load_type)
    file_back_path = os.path.join('\\',up_k_v['upload_path'],up_load_type)
    if os.path.exists(file_move_path):
        print(1212)
    else:
        print('22222222')
        checkDirBuild(basepath,file_back_path)
    # file_move_path =
    # print(file_back_path)
    return '123'
    pass

