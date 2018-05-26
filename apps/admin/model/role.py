from exts import db
from .role_admin import role_admin
import time

class Role(db.Model):
    __tablename__ = 'tb_role'
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    role_name = db.Column(db.String(100), nullable=False)
    role_type = db.Column(db.SmallInteger, nullable=False)
    describe  = db.Column(db.Text,nullable=True)
    _role_pri = db.Column(db.Text,nullable=True)
    _create_time = db.Column(db.Integer, nullable=False, default=time.time())
    admins = db.relationship('Admin', secondary=role_admin, backref=db.backref('roles',lazy='dynamic'))
    # 获取创建时间
    @property
    def create_time(self):
        create_time_value = time.strftime("%Y-%m-%d %H:%M:%S", time.localtime(self._create_time))
        return create_time_value

    # 获取权限值
    @property
    def role_pri(self):
        pris = self._role_pri.split(",")
        return pris

    @role_pri.setter
    def role_pri(self, input_role_pri):
        self._role_pri = ",".join(input_role_pri)



