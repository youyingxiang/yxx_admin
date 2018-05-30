# 公用函数文件 
from wtforms import Form
class FormBase(Form):    
    def get_err_one(self):
        err = self.errors.popitem()[1][0]
        return err

