from exts import db
import time
from .admin import Admin
class Log(db.Model):
    __tablename__ = 'tb_log'
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    log_type = db.Column(db.String(32),nullable=False)
    ip = db.Column(db.String(64),nullable=False)
    log_detail = db.Column(db.Text, nullable=False)
    admin_id = db.Column(db.Integer,nullable=False)
    admin = db.relationship("Admin",backref=db.backref('logs',lazy='dynamic'),primaryjoin=db.foreign(admin_id) == db.remote(Admin.id))
    _create_time = db.Column(db.Integer, nullable=False)

    @property
    def create_time(self):
        create_time_value = time.strftime("%Y-%m-%d %H:%M:%S", time.localtime(self._create_time))
        return create_time_value

    @create_time.setter
    def create_time(self, input_create_time):
        self._create_time = input_create_time