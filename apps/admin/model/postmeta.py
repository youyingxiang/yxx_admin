from exts import db
import time
class PostMeta(db.Model):
    __tablename__ = 'tb_postmeta'
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    meta_key = db.Column(db.String(256), index=True, nullable=False, default="", comment='键名')
    meta_value = db.Column(db.String(256), index=True, nullable=False, default="", comment='值名')
