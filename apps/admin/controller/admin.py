from flask import Blueprint,views,render_template,request,url_for
from apps.admin.model.admin import Admin
from ..form.admin import LoginForm
from exts import db
from think import restful

bp = Blueprint('adminadmin',__name__,url_prefix='/admin/admin')

# class UserAddView(views.MethodView):
#     #decorators = [login_required]
#     def render(self,data=None,message=None):
#         roles = Role.query.all()
#         return render_template('/admin/admin/add.html',data=data,message=message,roles=roles)
#     def get(self):
#         return self.render()
#     def post(self):
#         form = UserInfoForm(request.form)
#         if form.validate():
#             try:
#                 u = User(email=form.email.data,password=form.password.data,username=form.username.data)
#                 role = Role.query.get(request.form.get('role'))
#                 u.roles = [role]
#                 db.session.add(u)
#                 db.session.commit()
#                 return redirect(url_for('admin.userlist'))
#             except Exception as e:
#                 return  self.render(data=request.form,message=str(e))
#         else :
#             return self.render(data=request.form,message=form.get_err_one())
#         pass