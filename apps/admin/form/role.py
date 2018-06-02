from wtforms import StringField,IntegerField
from ..common import FormBase
from wtforms.validators import email,InputRequired,Length,EqualTo,ValidationError



class RoleNameForm(FormBase):
    role_name = StringField(validators=[InputRequired(message='角色名称不能为空'), Length(max=20, min=2, message='角色名称长度2-20位')])
class DescribeForm(FormBase):
    describe = StringField(validators=[Length(max=1000, message='角色描述太长')])
class RoleInfoForm(RoleNameForm,DescribeForm):
    pass