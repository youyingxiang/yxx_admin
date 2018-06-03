from flask import Blueprint,render_template,request,url_for,jsonify
from ..common import is_login,checkDirBuild,write_log
from apps.admin.model.config_field import ConfigField
from think import restful
import os,time,datetime
bp = Blueprint('adminupload',__name__,url_prefix='/admin/upload')

def __init__():
    print('3')


@bp.route('/upload/',methods=['POST'])
def upload():
    if is_login() == False:
        return restful.unauth_error(message="用户没有登录!没有上传权限")
    up_load_type = request.args.get('dir')                      #上传类型
    if up_load_type is None:
        return restful.params_error(message="请指定上传类型")
    up_conf_data = ConfigField.query.filter(ConfigField.state == 1).all()
    up_k_v = {}
    for v in up_conf_data:
        up_k_v[v.k] = v.v
    # 目录年月日
    y = str(datetime.datetime.now().year)
    m = str(datetime.datetime.now().month)
    d = str(datetime.datetime.now().day)
    basepath = os.path.abspath(os.path.join(os.path.dirname(__file__),'..','..','..','static'))
    file_move_path = os.path.join(basepath,up_k_v['upload_path'],up_load_type,y,m,d)
    file_back_path = os.path.join(os.sep,up_k_v['upload_path'],up_load_type,y,m,d)
    if os.path.exists(file_move_path) == False:
        try:
            checkDirBuild(basepath,file_back_path)
        except Exception as e:
            write_log(log_type='upload',log_detail='创建上传目录失败')
            return restful.server_error(message=str(e))
    if "imgFile" not in request.files:
        return restful.server_error(message="请选择文件！")
    file_info = request.files['imgFile']
    if file_info.filename == "":
        return restful.server_error(message="上传文件名称没有找到！")
    file_size = len(file_info.read())
    file_info.seek(-file_info.tell(), os.SEEK_CUR)        #指针读了一遍文件大小 拨回初始位置
    file_name = file_info.filename
    file_ext  = file_name.rsplit('.',1)[1]
    if int(file_size) > int(up_k_v[(up_load_type+"_size")]):
        msg = "上传内容大小超出系统设置大小！"
    elif file_ext not in up_k_v[(up_load_type+"_format")].split(','):
        msg = "上传内容格式与系统设置不符！"
    else:
        msg = ""
    if msg == "":
        new_filename = str(int(time.time())) + '.' + file_ext  # 修改了上传的文件名
        try:
            file_move_path = os.path.join(file_move_path,new_filename)
            file_info.save(file_move_path)
            file_back_path = os.sep+'static'+os.path.join(file_back_path,new_filename)
            if len(up_k_v.get('image_url')) > 0:
                file_back_path = up_k_v.get('image_url') + file_back_path
            file_back_path = file_back_path.replace('\\','/')
            return restful.success(message="操作成功",data={'file_name':file_name,"file_size":file_size,"file_path":file_back_path})
        except Exception as e:
            return restful.server_error(message=str(e))
    else:
        return restful.params_error(message=msg)
    pass


@bp.route('/kinder_upload/',methods=['POST'])
def kinder_upload():
    if is_login() == False:
        return restful.unauth_error(message="用户没有登录!没有上传权限")
    up_load_type = request.args.get('dir')                      #上传类型
    if up_load_type is None:
        return restful.params_error(message="请指定上传类型")
    up_conf_data = ConfigField.query.filter(ConfigField.state == 1).all()
    up_k_v = {}
    for v in up_conf_data:
        up_k_v[v.k] = v.v
    # 目录年月日
    y = str(datetime.datetime.now().year)
    m = str(datetime.datetime.now().month)
    d = str(datetime.datetime.now().day)
    basepath = os.path.abspath(os.path.join(os.path.dirname(__file__),'..','..','..','static'))
    file_move_path = os.path.join(basepath,up_k_v['upload_path'],up_load_type,y,m,d)
    file_back_path = os.path.join(os.sep,up_k_v['upload_path'],up_load_type,y,m,d)
    if os.path.exists(file_move_path) == False:
        try:
            checkDirBuild(basepath,file_back_path)
        except Exception as e:
            write_log(log_type='upload',log_detail='创建上传目录失败')
            return restful.server_error(message=str(e))
    if "imgFile" not in request.files:
        return restful.server_error(message="请选择文件！")
    file_info = request.files['imgFile']
    if file_info.filename == "":
        return restful.server_error(message="上传文件名称没有找到！")
    file_size = len(file_info.read())
    file_info.seek(-file_info.tell(), os.SEEK_CUR)        #指针读了一遍文件大小 拨回初始位置
    file_name = file_info.filename
    file_ext  = file_name.rsplit('.',1)[1]
    if int(file_size) > int(up_k_v[(up_load_type+"_size")]):
        msg = "上传内容大小超出系统设置大小！"
    elif file_ext not in up_k_v[(up_load_type+"_format")].split(','):
        msg = "上传内容格式与系统设置不符！"
    else:
        msg = ""
    if msg == "":
        new_filename = str(int(time.time())) + '.' + file_ext  # 修改了上传的文件名
        try:
            file_move_path = os.path.join(file_move_path,new_filename)
            file_info.save(file_move_path)
            file_back_path = os.sep+'static'+os.path.join(file_back_path,new_filename)
            if len(up_k_v.get('image_url')) > 0:
                file_back_path = up_k_v.get('image_url') + file_back_path
            file_back_path = file_back_path.replace('\\','/')
            return jsonify({'error':0,'url':file_back_path})
        except Exception as e:
            return restful.server_error(message=str(e))
    else:
        return restful.params_error(message=msg)
    pass

@bp.route('/manager/',methods=['GET','POST'])
def manager():
    # if is_login() == False:
    #     return restful.unauth_error(message="用户没有登录!没有上传权限")
    # up_conf_data = ConfigField.query.filter(ConfigField.state == 1).all()
    # up_k_v = {}
    # for v in up_conf_data:
    #     up_k_v[v.k] = v.v
    pass



