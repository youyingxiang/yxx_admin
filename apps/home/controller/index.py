from flask import Blueprint,render_template

bp = Blueprint('homeindex',__name__)

@bp.route('/<posts_name>/')
def index(posts_name):
    return render_template('/home/v1/index.html')