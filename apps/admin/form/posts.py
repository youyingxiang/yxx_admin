from wtforms import StringField,IntegerField
from ..common import FormBase
from wtforms.validators import email,InputRequired,Length,EqualTo,ValidationError

class PostTitle(FormBase):
    post_title = StringField(validators=[InputRequired(message='文章标题不能为空'), Length(max=256, min=2, message='标题长度2-256位')])

class PostExcerpt(FormBase):
    post_excerpt = StringField(validators=[Length(max=500,message='摘录最大长度不能超过500')])

class PostsForm(PostTitle,PostExcerpt):
    pass