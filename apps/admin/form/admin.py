from wtforms import StringField,IntegerField
from ..common import FormBase
from wtforms.validators import InputRequired,Length,ValidationError,NumberRange,EqualTo
from think.library.captche import Captcha
class AccountForm(FormBase):
    account = StringField(validators=[Length(max=32, min=6, message='帐号长度必须为6-32位')])

class PasswordForm(FormBase):
    password = StringField(validators=[InputRequired(message='密码不能为空'), Length(max=32, min=6, message='密码长度必须为6-32位')])

class SexForm(FormBase):
    sex = IntegerField(validators=[InputRequired(message='性别不能为空'),NumberRange(max=1,min=0,message="性别选项在0-1区间")])

class StateForm(FormBase):
    state = IntegerField(validators=[InputRequired(message='状态不能为空'),NumberRange(max=1,min=0,message="状态选项在0-1区间")])

class AdminNameForm(FormBase):
    admin_name =  StringField(validators=[InputRequired(message='用户姓名不能为空'),Length(max=20,min=2,message='用户姓名长度2-20位')])

class AdminForm(AccountForm,PasswordForm,SexForm,StateForm,AdminNameForm):
    repassword = StringField(validators=[EqualTo('password', message='两次密码不一致')])

class LoginForm(AccountForm,PasswordForm):
    code = StringField(validators=[InputRequired(message='验证码不能为空'),Length(max=4, min=4, message='验证码长度为4位')])
    def validate_code(self, field):
        code = field.data
        try:
            c = Captcha();
            check_res = c.check(code)
        except Exception as e:
            raise ValidationError(str(e))
        if check_res == False:
            raise ValidationError('验证码输入不正确！')