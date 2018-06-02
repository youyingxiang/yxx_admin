from wtforms import StringField,IntegerField,ValidationError
from ..common import FormBase
from wtforms.validators import email,InputRequired,Length,EqualTo,ValidationError,NumberRange

class KForm(FormBase):
    k = StringField(validators=[InputRequired(message='键不能为空'), Length(max=50, min=1, message='键长度必须为2-50位')])

class VForm(FormBase):
    pass

class DescForm(FormBase):
    desc= StringField(validators=[InputRequired(message='描述不能为空')])

class TypeForm(FormBase):
    type = StringField(validators=[InputRequired(message='类型不能为空'), Length(max=50, min=1, message='类型长度必须为2-50位')])

class TexttypeForm(FormBase):
    texttype = StringField(validators=[InputRequired(message='文本类型不能为空'), Length(max=100, min=1, message='文本类型长度必须为2-100位')])

class SortsForm(FormBase):
    sorts = IntegerField(validators=[InputRequired(message='文本类型不能为空')])
    def validate_sorts(self, field):
        sort = field.data
        if sort < 0:
            raise ValidationError('排序值必须大于0')



class StateForm(FormBase):
    state = IntegerField(validators=[InputRequired(message='状态不能为空'),NumberRange(max=1,min=0,message="状态选项在0-1区间")])
class Config_FieldForm(KForm,VForm,TypeForm,TexttypeForm,SortsForm,DescForm,StateForm):
    pass