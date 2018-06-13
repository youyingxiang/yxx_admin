from wtforms import StringField,IntegerField
from ..common import FormBase
from wtforms.validators import email,InputRequired,Length,EqualTo,ValidationError

class NameForm(FormBase):
    name = StringField(validators=[Length(max=256, min=1, message='名称长度必须为1-256位')])

class SlugForm(FormBase):
    slug = StringField(validators=[Length(max=256, min=1, message='别名长度必须为1-256位')])

class ImgForm(FormBase):
    img = StringField(validators=[Length(max=100, min=0, message='图片长度必须小于100位')])


class TermsForm(NameForm,SlugForm,ImgForm):
    pass