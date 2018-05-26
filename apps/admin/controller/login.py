from flask import Blueprint,views,render_template,request,url_for
from apps.admin.model.admin import Admin
from ..form.admin import LoginForm
from think import restful
bp = Blueprint('adminlogin',__name__,url_prefix='/admin/login')

# 登录
class LoginView(views.MethodView):
    def render(self,message=None):
        return render_template('admin/login/login.html',message=message)
    def get(self):
        return self.render()
    def post(self):
        form = LoginForm(request.form)
        if form.validate():
            account = form.account.data
            password = form.password.data
            admin_data = Admin.query.filter(Admin.account == account).first()
            if admin_data and admin_data.check_pwd(password):
                return restful.success(message='登陆成功',url=url_for('adminindex.index'))
            else:
                return restful.params_error(message='输入帐号密码错误')
        else:
            message = form.get_err_one()
            return restful.params_error(message=message)
@bp.route('/logout')
def logout():
    pass
bp.add_url_rule('/login',view_func=LoginView.as_view('login'))