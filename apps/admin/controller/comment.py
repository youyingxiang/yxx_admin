from flask import Blueprint,render_template

bp = Blueprint('admincomment',__name__,url_prefix='/admin/comment')

@bp.route('/')
def index():
    return render_template('admin/comment/index.html')