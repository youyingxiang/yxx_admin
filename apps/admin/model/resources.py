from exts import db
import time
from .posts import Posts
from .resources_relationships import resources_relationships
class Resources(db.Model):
    __tablename__ = 'tb_resources'
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    type = db.Column(db.Integer, nullable=False, default=1, comment='1 文章封面图片 2文章下载资源 3..')
    old_name = db.Column(db.String(256), nullable=False, default="", index=True, comment='上传前资源名称')
    new_name = db.Column(db.String(256), nullable=False, default="", index=True, comment='上传后资源名称')
    size = db.Column(db.Integer,nullable=False,default=0,comment='资源大小')
    posts = db.relationship('Posts', secondary = resources_relationships, backref=db.backref('resources', lazy='dynamic'))