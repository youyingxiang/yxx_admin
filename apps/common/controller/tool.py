from flask import Blueprint,render_template
from think.library.captche import Captcha
bp = Blueprint('commontool',__name__,url_prefix='/common/tool')


@bp.route('/captcha')
def captcha():
    c = Captcha()
    return c.entry()