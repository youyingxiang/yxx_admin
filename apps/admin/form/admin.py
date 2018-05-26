from wtforms import StringField
from ..common import FormBase
from wtforms.validators import InputRequired,Length,ValidationError
from think.library.captche import Captcha

class AdminForm(FormBase):
    pass

class LoginForm(FormBase):
    account = StringField(validators=[Length(max=32,min=6,message='帐号长度必须为6-32位')])
    password = StringField(validators=[InputRequired(message='密码不能为空'), Length(max=32, min=6, message='密码长度必须为6-32位')])
    code = StringField(validators=[InputRequired(message='验证码不能为空'),Length(max=4, min=4, message='验证码长度为4位')])
    def validate_code(self, field):
        code = field.data
        print(code)
        try:
            c = Captcha();
            check_res = c.check(code)
        except Exception as e:
            raise ValidationError(str(e))
        if check_res == False:
            raise ValidationError('验证码输入不正确！')