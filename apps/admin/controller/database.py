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
    try:
        table_names = request.form.get('id')
        if table_names is not None and len(table_names) > 0:
            table_names = table_names.split(',')
            b = Baksql(save_path=os.path.join(APP_ROOT_PATH,'static','databases'))
            result = b.backup(table_names)
            write_log(log_type='backup',log_detail="备份成功！")
            return restful.success(message=result,url=url_for('admindatabase.index'))
        else:
            raise ValueError("没有选择的备份文件！")
    except Exception as e:
        write_log(log_type='backup', log_detail="行为：备份数据库文件；错误：" + str(e))
        return restful.server_error(message=str(e))


@bp.route('/reduction/')
def reduction():
    b = Baksql(save_path=os.path.join(APP_ROOT_PATH,'static','databases'))
    dataList = b.get_filelist();
    return render_template('/admin/database/reduction.html', data=dataList)

@bp.route('/dowonload/')
def dowonload():
    try:
        filename = request.args.get('id')
        if filename is not None:
            b = Baksql(save_path=os.path.join(APP_ROOT_PATH, 'static', 'databases'))
            result = b.downloadFile(filename)
            write_log(log_type='download', log_detail="下载备份成功")
            return result
        else:
            raise ValueError("没有选择文件")
    except Exception as e:
        write_log(log_type='download', log_detail="行为：下载备份文件；错误："+str(e))
        abort(404)


@bp.route('/restore/',methods=['POST'])
def restore():
    '''
    还原数据库
    :return:
    '''
    try:
        filename = request.form.get('id')
        if filename is not None:
            b = Baksql(save_path=os.path.join(APP_ROOT_PATH, 'static', 'databases'))
            result = b.restore(filename)
            write_log(log_type='restore', log_detail="还原备份成功！")
            return restful.success(message=result, url=url_for('admindatabase.reduction'))
        else:
            raise ValueError("未选择文件！")
    except Exception as e:
        write_log(log_type='restore', log_detail="行为：还原数据库；错误："+str(e))
        return restful.server_error(message=str(e))

@bp.route('/delete/',methods=['POST'])
def delete():
    filename = request.form.get('id')
    try:
        if filename is not None:
            b = Baksql(save_path=os.path.join(APP_ROOT_PATH, 'static', 'databases'))
            result = b.delfilename(filename)
            return restful.success(message=result, url=url_for('admindatabase.reduction'))
        else:
            raise ValueError('未选择删除的文件')
    except Exception as e:
        write_log(log_type='delete', log_detail="行为：删除备份文件；错误：！")
        return restful.server_error(message=str(e))

