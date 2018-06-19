from exts import db
import time
from .postmeta import PostMeta
from .resources_relationships import resources_relationships
class Resources(db.Model):
    __tablename__ = 'tb_resources'
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    old_name = db.Column(db.String(256), nullable=False, default="", index=True, comment='上传前资源名称')
    new_name = db.Column(db.String(256), nullable=False, default="", index=True, comment='上传后资源名称')
    size = db.Column(db.Integer,nullable=False,default=0,comment='资源大小')
    postmetas = db.relationship('PostMeta', secondary = resources_relationships, backref=db.backref('resources', lazy='dynamic'))