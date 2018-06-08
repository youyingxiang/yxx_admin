from exts import db
import time
from .admin import Admin
class Posts(db.Model):
    __tablename__ = 'tb_posts'
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    post_author = db.Column(db.Integer,nullable=False,index=True,comment="作者")
    _create_time = db.Column(db.Integer,nullable=False,default=time.time(),comment="修改时间")
    post_content = db.Column(db.Text, nullable=False,default="",comment="文章内容")
    post_title = db.Column(db.String(256),index=True, nullable=False,default="",comment='文章标题')
    post_excerpt = db.Column(db.String(500), nullable=False,default="",comment='文章摘录')
    post_status = db.Column(db.SmallInteger,nullable=False,default=1,comment='文章状态 1审核 0未审核')
    comment_status = db.Column(db.SmallInteger,nullable=False,default=1,comment='评论状态 1开启 2关闭')
    post_name = db.Column(db.String(256), nullable=False,default="",index=True,comment='文章简化名称')
    _update_time  = db.Column(db.Integer,nullable=False,default=time.time(),comment='修改时间')
    menu_order = db.Column(db.Integer,nullable=False,default=1,comment='排序')
    post_type =  db.Column(db.Integer,nullable=False,default=1,comment='文章类型 1普通文章 2单页')
    comment_count = db.Column(db.Integer,nullable=False,default=0,comment='评论数量')
    admin = db.relationship("Admin", backref=db.backref('posts'),primaryjoin=db.foreign(post_author) == db.remote(Admin.id))

    @property
    def create_time(self):
        create_time_value = time.strftime("%Y-%m-%d %H:%M:%S", time.localtime(self._create_time))
        return create_time_value

    @create_time.setter
    def create_time(self, input_create_time):
        self._create_time = input_create_time