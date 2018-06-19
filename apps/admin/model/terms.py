from exts import db
import time
from .term_taxonomy import TermTaxonomy
from ..model.postmeta import PostMeta
class Terms(db.Model):
    __tablename__ = 'tb_terms'
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    name = db.Column(db.String(256), nullable=False, default="", index=True, comment='分类名')
    slug = db.Column(db.String(256), nullable=False, default="", index=True, comment='缩略名')
    term_order = db.Column(db.Integer,nullable=False,default=1,comment='排序')
    term_taxonomy = db.relationship("TermTaxonomy", backref=db.backref('terms'),uselist=False,primaryjoin=db.foreign(id) == db.remote(TermTaxonomy.term_id))
