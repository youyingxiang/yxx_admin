from flask import Blueprint,views,render_template,request,url_for,abort
from apps.admin.model.log import Log
from ..config import PAGE_SIZE
from sqlalchemy import or_,text
from exts import db
from ..common import write_log
from think import restful
import time
bp = Blueprint('adminlog',__name__,url_prefix='/admin/log')

@bp.route('/index/',methods=['POST','GET'])
def index():
    search = request.args.get('search')
    sort = request.args.get('_sort')
    where = ""
    if search is not None:
        where = or_(Log.log_type.like("%"+search.strip()+"%"),Log.ip.like("%"+search.strip()+"%"))
    if sort is not None:
        order = sort.split(',')
        order = order[0]+' '+order[1]
    else:
        order = "id asc"
    get_page = request.args.get('page')
    if get_page is not None and get_page.isdigit() == True and int(get_page) > 1:
        page = int(get_page)
    else:
        page = 1
    logs = Log.query.filter(where).order_by(order).paginate(page,per_page=PAGE_SIZE)
    return render_template('/admin/log/index.html',data=logs)

@bp.route('/delete/',methods=['GET'])
def delete():
    try:
        endtime = time.time() - 60*60*24*7
        res = Log.query.filter(text("_create_time <"+ str(endtime))).delete(synchronize_session=False)
        db.session.commit()
        write_log(log_type='add', log_detail='删除日志成功')
        return restful.success('删除成功！',url=url_for('adminlog.index'))
    except Exception as e:
        write_log(log_type='add', log_detail='删除日志失败')
        return restful.server_error(message=str(e),url=url_for('adminlog.index'))
    pass