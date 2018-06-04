from flask import Blueprint,render_template,request,url_for,abort
from think.baksql import Baksql
from exts import db
from config import APP_ROOT_PATH
from ..common import write_log
from think import restful
bp = Blueprint('admindatabase',__name__,url_prefix='/admin/database')
import os
@bp.route('/index/')
def index():
    dataList = db.session().execute("SHOW TABLE STATUS").fetchall()
    return render_template('/admin/database/index.html',data=dataList)


@bp.route('/backup/',methods=['POST'])
def backup():
    '''
    备份
    :return:
    '''
    table_names = request.form.get('id')
    if table_names is not None and len(table_names) > 0:
        table_names = table_names.split(',')
        b = Baksql(save_path=os.path.join(APP_ROOT_PATH,'static','databases'))
        result = b.backup(table_names)
        if result == False:
            write_log(log_type='backup', log_detail="备份失败！")
            return restful.server_error(b.get_error())
        else:
            write_log(log_type='backup',log_detail="备份成功！")
            return restful.success(message=result,url=url_for('admindatabase.index'))
    else:
        write_log(log_type='backup', log_detail="备份失败！")
        return restful.params_error()


@bp.route('/reduction/')
def reduction():
    b = Baksql(save_path=os.path.join(APP_ROOT_PATH,'static','databases'))
    dataList = b.get_filelist();
    return render_template('/admin/database/reduction.html', data=dataList)

@bp.route('/dowonload/')
def dowonload():
    filename = request.args.get('id')
    if filename is not None:
        b = Baksql(save_path=os.path.join(APP_ROOT_PATH, 'static', 'databases'))
        result = b.downloadFile(filename)
        if result == False:
            write_log(log_type='download', log_detail="下载备份失败！")
            abort(404)
        else:
            write_log(log_type='download', log_detail="下载备份成功")
            return result
    else:
        write_log(log_type='download', log_detail="下载备份失败！")
        abort(404)
    pass


@bp.route('/restore/',methods=['POST'])
def restore():
    '''
    还原数据库
    :return:
    '''
    filename = request.form.get('id')
    if filename is not None:
        b = Baksql(save_path=os.path.join(APP_ROOT_PATH, 'static', 'databases'))
        result = b.restore(filename)
        if result == False:
            write_log(log_type='restore', log_detail="还原备份失败！")
            return restful.params_error(message=b.get_error())
        else:
            write_log(log_type='restore', log_detail="还原备份成功！")
            return restful.success(message=result, url=url_for('admindatabase.reduction'))
    else:
        write_log(log_type='restore', log_detail="还原备份失败！")
        return restful.params_error()
    pass

@bp.route('/delete/',methods=['POST'])
def delete():
    filename = request.form.get('id')
    if filename is not None:
        b = Baksql(save_path=os.path.join(APP_ROOT_PATH, 'static', 'databases'))
        result = b.delfilename(filename)
        return restful.success(message=result, url=url_for('admindatabase.reduction'))
    else:
        write_log(log_type='delete', log_detail="删除备份失败！")
        return restful.params_error()
    pass
