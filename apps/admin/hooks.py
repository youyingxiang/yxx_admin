from flask import session,g,request,redirect,url_for,render_template
from .controller.admin import bp as admin_bp
from .controller.role import bp as role_bp
from .controller.config_field import bp as config_field_bp
from .controller.log import bp as log_bp
from .controller.index import bp as index_bp
from .controller.database import bp as db_bp
from .config import ADMIN_SESSION_ID
from .model.admin import Admin
from .config import menu

@db_bp.before_request
@log_bp.before_request
@role_bp.before_request
@config_field_bp.before_request
@admin_bp.before_request
@index_bp.before_request
def before_request():
    get_global_search()
    session[ADMIN_SESSION_ID] =1
    if check_login() == False:
        return redirect(url_for('adminlogin.login'))
    if hooks_auth(request.path) == False:
        return redirect(url_for('adminindex.index'))


def get_global_search():
    if request.args.get('search') is not None:
        g.search = request.args.get('search')

def check_login():
    if ADMIN_SESSION_ID  in session:
        admin_id = session.get(ADMIN_SESSION_ID)
        admin = Admin.query.get(admin_id)
        if admin:
            g.admin = admin
            ## sql 减少查询优化
            roles = g.admin.roles.first()
            g.role_pri_path = roles.role_pri_path
            g.role_type = roles.role_type
            g.role_pri = roles.role_pri
            g.role_name = roles.role_name
            return True
        else:
            return False
    else:
        return False

def hooks_auth(path):
    have_auth = False
    # 不是登录的路由
    if g.admin:
        if g.role_type == 1:
            have_auth = True
        elif str(path) in ['/admin/login/login/','/admin/admin/logout/','/admin/index/index/','/admin/config_field/save/']:
            have_auth = True
        else:
            pri = g.role_pri_path
            if path in pri:
                have_auth = True
        return have_auth
@db_bp.context_processor
@log_bp.context_processor
@role_bp.context_processor
@config_field_bp.context_processor
@admin_bp.context_processor
@index_bp.context_processor
def menu_c():
    if ADMIN_SESSION_ID in session:
        if g.role_type == 1:
            have_auth = 'all'
        else:
            have_auth = g.role_pri
    else:
        have_auth = []
    return {'menu': menu, 'have_auth': have_auth}

@db_bp.errorhandler(404)
@role_bp.errorhandler(404)
@admin_bp.errorhandler(404)
@config_field_bp.errorhandler(404)
@index_bp.errorhandler(404)
def page_not_found(e):
    return render_template('/admin/error/404.html'),404

@db_bp.errorhandler(500)
@role_bp.errorhandler(500)
@admin_bp.errorhandler(500)
@config_field_bp.errorhandler(500)
@index_bp.errorhandler(500)
def server_error(e):
    return render_template('/admin/error/500.html'),500
