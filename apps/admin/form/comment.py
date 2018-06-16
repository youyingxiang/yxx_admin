from wtforms import StringField,IntegerField
from ..common import FormBase
from think.library.captche import Captcha
from wtforms.validators import email,InputRequired,Length,EqualTo,ValidationError

class CommentContentForm(FormBase):
    comment_content = StringField(validators=[InputRequired(message='评论内容不能为空'), Length(max=1000, min=1, message='类型长度必须为1-1000位')])
class CommentForm(CommentContentForm):
    code = StringField(validators=[InputRequired(message='验证码不能为空'), Length(max=4, min=4, message='验证码长度为4位')])
    def validate_code(self, field):
        code = field.data
        try:
            c = Captcha();
            check_res = c.check(code)
        except Exception as e:
            raise ValidationError(str(e))
        if check_res == False:
            raise ValidationError('验证码输入不正确！')
    pass