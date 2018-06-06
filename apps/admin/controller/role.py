from flask import Blueprint,views,render_template,request,url_for,abort
from apps.admin.model.role import Role
from ..config import menu,role_type,PAGE_SIZE
from ..form.role import RoleInfoForm,RoleNameForm,DescribeForm
from think import restful
from exts import db
from sqlalchemy import text
from  ..common import get_str_upper,write_log
import time
bp = Blueprint('adminrole',__name__,url_prefix='/admin/role')

class RoleAddView(views.MethodView):
    # decorators = [login_required]
    pris = menu
    def get(self):
        return render_template('/admin/role/add.html', role_type=role_type,menu=menu)
    def post(self):
        try:
            form = RoleInfoForm(request.form)
            if form.validate():
                r = Role(
                    role_name=form.role_name.data,
                    role_type=request.form.get('role_type'),
                    describe=form.describe.data,
                    role_pri = request.form.getlist('role_pri'),
                    create_time =time.time()
                )
                db.session.add(r)
                db.session.commit()
                write_log(log_type='add', log_detail='增加角色成功')
                return restful.success(message="操作成功",url = url_for('adminrole.index'))
            else:
                raise ValueError(form.get_err_one())
        except Exception as e:
            write_log(log_type='add', log_detail="行为：新增角色；错误：" + str(e))
            return restful.server_error(message=str(e))
class RoleEditView(views.MethodView):
    pris = menu
    def get(self):
        role_id = request.args.get('id')
        if role_id is not None:
            roleinfo = Role.query.get(role_id)
            return render_template('/admin/role/edit.html',data=roleinfo,role_type=role_type,menu=menu)
        else:
            abort(404)
    def post(self):
        try:
            if len(request.form) == 2:
                for v in request.form:
                    if v != 'id':
                        object_name = get_str_upper(v,'_')+"Form"
                        form = eval(object_name)(request.form)
            else:
                form = RoleInfoForm(request.form)
            if form.validate():
                role= Role.query.get(request.form.get('id'))
                if request.form.getlist('role_pri'):role.role_pri = request.form.getlist('role_pri')
                if request.form.get('role_name') is not None:role.role_name = request.form.get('role_name')
                if request.form.get('role_type') is not None:role.role_type = request.form.get('role_type')
                if request.form.get('describe') is not None:role.describe  = request.form.get('describe')
                db.session.commit()
                write_log(log_type='edit', log_detail='修改角色成功')
                return restful.success(message="操作成功", url=url_for('adminrole.index'))
            else:
                raise ValueError(form.get_err_one())
        except Exception as e:
            write_log(log_type='edit', log_detail="行为：修改角色；错误：" + str(e))
            return restful.server_error(message=str(e))

@bp.route('/index/',methods=['POST','GET'])
def index():
    search = request.args.get('search')
    sort = request.args.get('_sort')
    where = ""
    if search is not None:
        where = Role.role_name.like("%"+search.strip()+"%")
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
    roles = Role.query.filter(where).order_by(order).paginate(page,per_page=PAGE_SIZE)
    return render_template('/admin/role/index.html', data=roles,role_type = role_type)

@bp.route('/delete/',methods=['POST'])
def delete():
    ids = request.form.get('id')
    try:
        if id is not None:
            res = Role.query.filter(Role.id.in_(ids.split(','))).delete(synchronize_session=False)
            db.session.commit()
            write_log(log_type='delete', log_detail='删除角色成功')
            return restful.success('删除成功！',url=url_for('adminrole.index'))
    except Exception as e:
        write_log(log_type='delete', log_detail="行为：删除角色；错误："+str(e))
        return restful.server_error(message=str(e))
    pass

bp.add_url_rule('/add/',view_func=RoleAddView.as_view('add'))
bp.add_url_rule('/edit/',view_func=RoleEditView.as_view('edit'))