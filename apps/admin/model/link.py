from exts import db
import time
class Link(db.Model):
    __tablename__ = 'tb_link'
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    name = db.Column(db.String(150),nullable=False)
    link = db.Column(db.String(150), nullable=False)
    slug = db.Column(db.String(150), nullable=False,default="")