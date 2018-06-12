from wtforms import StringField,IntegerField
from ..common import FormBase
from wtforms.validators import email,InputRequired,Length,EqualTo,ValidationError,NumberRange

class PostTitleForm(FormBase):
    post_title = StringField(validators=[InputRequired(message='文章标题不能为空'), Length(max=256, min=2, message='标题长度2-256位')])

class PostExcerptForm(FormBase):
    post_excerpt = StringField(validators=[Length(max=500,message='摘录最大长度不能超过500')])
class PostStatusForm(FormBase):
    post_status = IntegerField(validators=[InputRequired(message='状态不能为空'),NumberRange(max=1,min=0,message="状态选项在0-1区间")])

class PostsForm(PostTitleForm,PostExcerptForm,PostStatusForm):
    pass