from exts import db
from werkzeug.security import check_password_hash,generate_password_hash
import time
class Admin(db.Model):
    __tablename__ = 'tb_admin'
    id = db.Column(db.Integer,primary_key=True,autoincrement=True)
    admin_name = db.Column(db.String(100), nullable=False)
    _password = db.Column(db.String(100), nullable=False)
    img = db.Column(db.String(100), nullable=False)
    account = db.Column(db.String(32),unique=True, nullable=False)
    sex = db.Column(db.SmallInteger,nullable=False,default=1)
    state = db.Column(db.SmallInteger,nullable=False,default=1)
    _last_time = db.Column(db.Integer,nullable=False,default=time.time())
    _create_time = db.Column(db.Integer,nullable=False,default=time.time())

    # 获取密码
    @property
    def password(self):
        return self._password

    # 密码加密
    @password.setter
    def password(self, input_password):
        self._password = generate_password_hash(input_password)

    # 检测密码
    def check_pwd(self, input_password):
        res = check_password_hash(self._password, input_password)
        return res

    # 获取创建时间
    @property
    def create_time(self):
        create_time_value = time.strftime("%Y-%m-%d %H:%M:%S", time.localtime(self._create_time))
        return create_time_value

    @create_time.setter
    def create_time(self, input_create_time):
        self._create_time = input_create_time

    # 获取最后一次登录时间
    @property
    def last_time(self):
        last_time_value = time.strftime("%Y-%m-%d %H:%M:%S", time.localtime(self._last_time))
        return last_time_value

    @last_time.setter
    def last_time(self, input_last_time):
        self._last_time = input_last_time


