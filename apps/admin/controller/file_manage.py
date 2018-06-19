from flask import Blueprint,render_template

bp = Blueprint('adminfile_manage',__name__,url_prefix='/admin/file_manage')

@bp.route('/')
def index():
    return render_template('admin/file_manage/index.html')