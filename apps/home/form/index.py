from wtforms import StringField,IntegerField
from ..common import FormBase
from wtforms.validators import email,InputRequired,Length,EqualTo,ValidationError

class IndexForm(FormBase):
    pass