from flask import Blueprint,render_template

bp = Blueprint('homeindex',__name__)

@bp.route('/')
def index():
    return render_template('/home/v1/index.html')

@bp.route('/category/<category>/')
def category(category):
    return '123'
    pass