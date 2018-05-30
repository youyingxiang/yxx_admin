from flask import Blueprint,views,render_template,request,url_for
from apps.admin.model.role import Role
from ..config import menu,role_type
from ..form.role import RoleInfoForm
from think import restful
from exts import db
from sqlalchemy import text
import time
bp = Blueprint('adminrole',__name__,url_prefix='/admin/role')

class RoleAddView(views.MethodView):
    # decorators = [login_required]
    pris = menu
    def get(self):
        return render_template('/admin/role/add.html', role_type=role_type,menu=menu)

    def post(self):
        form = RoleInfoForm(request.form)
        if form.validate():
            try:
                r = Role(
                    role_name=form.role_name.data,
                    role_type=request.form.get('role_type'),
                    describe=form.describe.data,
                    role_pri = request.form.getlist('role_pri'),
                    create_time =time.time()
                )
                db.session.add(r)
                db.session.commit()
                return restful.success(message="操作成功",url = url_for('adminrole.index'))
            except Exception as e:
                return restful.server_error(message=str(e))
        else:
            return restful.params_error(message=form.get_err_one())
        pass
class RoleEditView(views.MethodView):
    # decorators = [login_required]
    pris = menu
    def get(self):
        role_id = request.args.get('id')
        if role_id is not None:
            roleinfo = Role.query.get(role_id)
            return render_template('/admin/role/edit.html',data=roleinfo,role_type=role_type,menu=menu)
    def post(self):
        if len(request.form) == 2:
            form = RoleInfoForm(request.form)
        else:
            form = RoleInfoForm(request.form)
        if form.validate():
            try:
                role= Role.query.get(request.form.get('id'))
                role.role_pri = request.form.getlist('role_pri')
                role.role_name = request.form.get('role_name')
                role.role_type = request.form.get('role_type')
                role.describe  = request.form.get('describe')
                db.session.commit()
                return restful.success(message="操作成功", url=url_for('adminrole.index'))
            except Exception as e:
                return restful.server_error(message=str(e))
        else:
            return restful.params_error(message=form.get_err_one())
        pass
@bp.route('/index')
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
    roles = Role.query.filter(where).order_by(order).all()
    return render_template('/admin/role/index.html', data=roles,role_type = role_type)

@bp.route('/delete',methods=['POST'])
def delete():
    ids = request.form.get('id')
    try:
        if id is not None:
            res = Role.query.filter(Role.id.in_(ids.split(','))).delete(synchronize_session=False)
            db.session.commit()
            return restful.success('删除成功！',url=url_for('adminrole.index'))
    except Exception as e:
        return restful.server_error(message=str(e))
    pass
bp.add_url_rule('/add/',view_func=RoleAddView.as_view('add'))
bp.add_url_rule('/edit/',view_func=RoleEditView.as_view('edit'))