from flask import Blueprint,render_template

bp = Blueprint('homeindex',__name__)

@bp.route('/')
def index():
    return '<h1 style="margin=200px,auto">欢迎来到thinkpy</h1>'