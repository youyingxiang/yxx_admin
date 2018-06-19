from flask import Blueprint,views,render_template,request,url_for,abort,g
from apps.admin.model.admin import Admin
from apps.admin.model.role import Role
from ..form.admin import LoginForm,AdminForm,AccountForm,SexForm,StateForm,AdminNameForm
from exts import db
from think import restful
from ..common import get_str_upper,write_log
from sqlalchemy import or_
import time
from ..config import PAGE_SIZE

bp = Blueprint('adminadmin',__name__,url_prefix='/admin/admin')

class AdminAddView(views.MethodView):
    #decorators = [login_required]
    def get(self):
        roles = Role.query.all()
        return render_template('/admin/admin/add.html',roles=roles)
    def post(self):
        form = AdminForm(request.form)
        try:
            if form.validate():
                a = Admin(
                    admin_name = request.form.get('admin_name'),
                    password = request.form.get('password'),
                    img = request.form.get('img'),
                    account = request.form.get('account'),
                    sex = request.form.get('sex'),
                    state = request.form.get('state'),
                    create_time = time.time(),
                    last_time = time.time()
                )
                role = Role.query.get(request.form.get('role_id'))
                a.roles = [role]
                db.session.add(a)
                db.session.commit()
                write_log(log_type='add',log_detail='增加操作员成功')
                return restful.success(message="操作成功", url=url_for('adminadmin.index'))
            else:
                raise ValueError(form.get_err_one())
        except Exception as e:
            write_log(log_type='add',log_detail="行为：新增操作员；错误："+str(e))
            return restful.server_error(message=str(e))

class AdminEditView(views.MethodView):
    #decorators = [login_required]
    def get(self):
        admin_id = request.args.get('id')
        roles = Role.query.all()
        if admin_id is not None:
            admininfo = Admin.query.get(admin_id)
            return render_template('/admin/admin/edit.html',data=admininfo,roles=roles)
        else:
            abort(404)
    def post(self):
        try:
            if len(request.form) == 2:
                for v in request.form:
                    if v != 'id':
                        object_name = get_str_upper(v, '_') + "Form"
                        form = eval(object_name)(request.form)
            else:
                form = AdminForm(request.form)
            if form.validate():
                admin = Admin.query.get(request.form.get('id'))
                if request.form.getlist('admin_name'): admin.admin_name = request.form.getlist('admin_name')
                if request.form.get('password') is not None: admin.password = request.form.get('password')
                if request.form.get('img') is not None: admin.img= request.form.get('img')
                if request.form.get('account') is not None: admin.account = request.form.get('account')
                if request.form.get('sex') is not None: admin.sex = request.form.get('sex')
                if request.form.get('state') is not None: admin.state = request.form.get('state')
                if request.form.get('role_id') is not None:
                    role = Role.query.get(request.form.get('role_id'))
                    admin.roles = [role]
                db.session.commit()
                write_log(log_type='edit', log_detail='修改操作员成功')
                return restful.success(message="操作成功", url=url_for('adminadmin.index'))
            else:
                raise ValueError(form.get_err_one())
        except Exception as e:
            write_log(log_type='edit', log_detail="行为：修改操作员；错误："+str(e))
            return restful.server_error(message=str(e))

@bp.route('/index/',methods=['POST','GET'])
def index():
    search = request.args.get('search')
    sort = request.args.get('_sort')
    where = ""
    if search is not None:
        where = or_(Admin.admin_name.like("%"+search.strip()+"%"),Admin.account.like("%"+search.strip()+"%"))
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
    admins = Admin.query.filter(where).order_by(order).paginate(page,per_page=PAGE_SIZE)
    return render_template('/admin/admin/index.html',data=admins)

@bp.route('/delete/',methods=['POST'])
def delete():
    ids = request.form.get('id')
    try:
        if id is not None:
            res = Admin.query.filter(Admin.id.in_(ids.split(','))).delete(synchronize_session=False)
            db.session.commit()
            write_log(log_type='delete', log_detail='删除操作员成功')
            return restful.success('删除成功！',url=url_for('adminadmin.index'))
    except Exception as e:
        write_log(log_type='delete', log_detail="行为：删除操作员；错误："+str(e))
        return restful.server_error(message=str(e))
    pass
bp.add_url_rule('/add/',view_func=AdminAddView.as_view('add'))
bp.add_url_rule('/edit/',view_func=AdminEditView.as_view('edit'))