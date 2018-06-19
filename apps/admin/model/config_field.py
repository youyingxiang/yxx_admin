from exts import db
import time
class ConfigField(db.Model):
    __tablename__ = 'tb_config_field'
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    k = db.Column(db.String(50),nullable=False)
    v = db.Column(db.Text, nullable=True)
    type = db.Column(db.String(50), nullable=False)
    desc = db.Column(db.Text, nullable=True)
    prompt = db.Column(db.String(250), nullable=False)
    sorts = db.Column(db.Integer,nullable=False,default=99)
    state = db.Column(db.SmallInteger,nullable=False,default=1)
    texttype = db.Column(db.String(100), nullable=False)
    textvalue = db.Column(db.String(100), nullable=False,default="")
    _create_time = db.Column(db.Integer, nullable=False)

    @property
    def create_time(self):
        create_time_value = time.strftime("%Y-%m-%d %H:%M:%S", time.localtime(self._create_time))
        return create_time_value

    @create_time.setter
    def create_time(self, input_create_time):
        self._create_time = input_create_time



