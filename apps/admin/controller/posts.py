from flask import Blueprint,render_template

bp = Blueprint('adminposts',__name__,url_prefix='/admin/posts')

@bp.route('/')
def index():
    return render_template('admin/posts/index.html')