from flask import Blueprint,render_template

bp = Blueprint('adminupload',__name__,url_prefix='/admin/upload')

@bp.route('/upload')
def upload():
    pass