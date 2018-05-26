from flask import Blueprint,views,render_template,request,url_for,redirect
from apps.admin.model.role import Role
from ..config import menu
from ..form.role import RoleInfoForm
from exts import db
bp = Blueprint('adminrole',__name__,url_prefix='/admin/role')

class RoleAddView(views.MethodView):
    # decorators = [login_required]
    pris = menu

    def render(self, data=None, message=None):
        if data:
            data = {
                'role_pri':data.getlist('role_pri'),
                'role_type':data.get('role_type'),
                'describe':data.get('describe'),
                'role_name':data.get('role_name')
            }
            pass
        return render_template('/admin/role/add.html', data=data, message=message,menu=self.pris)

    def get(self):
        return self.render()

    def post(self):
        form = RoleInfoForm(request.form)
        if form.validate():
            try:
                r = Role(
                    role_name=form.role_name.data,
                    role_type=request.form.get('role_type'),
                    describe=form.describe.data,
                    role_pri = request.form.getlist('role_pri')
                )
                db.session.add(r)
                db.session.commit()
                return redirect(url_for('adminrole.index'))
            except Exception as e:
                return self.render(data=request.form, message=str(e))
        else:
            return self.render(data=request.form, message=form.get_err_one())
        pass
@bp.route('/index')
def index():
    return render_template('/admin/role/index.html')
bp.add_url_rule('/add/',view_func=RoleAddView.as_view('add'))