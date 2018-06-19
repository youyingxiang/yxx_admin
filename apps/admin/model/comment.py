from exts import db
from .posts import Posts
import time
class Comment(db.Model):
    __tablename__ = 'tb_comment'
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    post_id = db.Column(db.Integer,nullable=False,default=0)
    ip = db.Column(db.String(64),nullable=False,default="")
    comment_content = db.Column(db.Text, nullable=False)
    comment_parent = db.Column(db.Integer,nullable=False,default=0)
    state = db.Column(db.SmallInteger, nullable=False, default=1)
    user_id = db.Column(db.Integer,nullable=False,default=0)
    _create_time = db.Column(db.Integer, nullable=False)
    posts = db.relationship("Posts", backref=db.backref('comments'),primaryjoin=db.foreign(post_id) == db.remote(Posts.id))
    # 获取创建时间
    @property
    def create_time(self):
        create_time_value = time.strftime("%Y-%m-%d %H:%M:%S", time.localtime(self._create_time))
        return create_time_value

    @create_time.setter
    def create_time(self, input_create_time):
        self._create_time = input_create_time