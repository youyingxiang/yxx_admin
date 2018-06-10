from exts import db
import time
from .postmeta import PostMeta
from .term_relationships import term_relationships
class TermTaxonomy(db.Model):
    __tablename__ = 'tb_term_taxonomy'
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    term_id = db.Column(db.Integer,nullable=False,comment='分类方法ID')
    taxonomy = db.Column(db.Integer,nullable=False,default=1,comment='分类方法 1分类 2标签 3菜单')
    img = db.Column(db.String(100), nullable=False,comment="图像描叙",default="")
    parent = db.Column(db.Integer,nullable=False,comment='上级ID')
    count = db.Column(db.Integer,nullable=False,comment='文章数统计',default=0)
    postmetas = db.relationship('PostMeta', secondary=term_relationships, backref=db.backref('terms', lazy='dynamic'))
