from exts import db
from flask import url_for
from .role_admin import role_admin
from ..config import menu
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

    @create_time.setter
    def create_time(self,input_create_time):
        self._create_time = input_create_time

    # 获取权限值
    @property
    def role_pri(self):
        pris = self._role_pri.split(",")
        return pris

    @property
    def role_pri_name(self):
        pris = self.role_pri
        pris_name = []
        for v in menu:
            if str(v.get('id')) in pris:
                pris_name.append(v.get('pri_name'))
            if v.get('child'):
                for vv in v.get('child'):
                    if str(vv.get('id')) in pris:
                        pris_name.append(vv.get('pri_name'))
                    if vv.get('child'):
                        for vvv in vv.get('child'):
                            if str(vvv.get('id')) in pris:
                                pris_name.append(vvv.get('pri_name'))
        return ",".join(pris_name)

        pass
    @role_pri.setter
    def role_pri(self, input_role_pri):
        self._role_pri = ",".join(input_role_pri)

    @property
    def role_pri_path(self):
        pris = self._role_pri.split(",")
        pri_path = []
        for v in menu:
            if str(v.get('id')) in pris:
                if v.get('action_name'):
                    path = url_for(v.get('url_prefix') +'.'+  v.get('action_name'))
                    pri_path.append(path)
            if v.get('child'):
                for vv in v.get('child'):
                    if str(vv.get('id')) in pris:
                        if vv.get('action_name'):
                            path = url_for(vv.get('url_prefix') +'.'+ vv.get('action_name'))
                            pri_path.append(path)
                    if vv.get('child'):
                        for vvv in vv.get('child'):
                            if str(vvv.get('id')) in pris:
                                if vv.get('action_name'):
                                    path = url_for(vvv.get('url_prefix') +'.'+  vvv.get('action_name'))
                                    pri_path.append(path)
        return ",".join(pri_path)





