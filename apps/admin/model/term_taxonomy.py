from exts import db
import time,json
from .postmeta import PostMeta
from .term_relationships import term_relationships
from .link import Link
from sqlalchemy import and_
class TermTaxonomy(db.Model):
    __tablename__ = 'tb_term_taxonomy'
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    term_id = db.Column(db.Integer,nullable=False,comment='分类方法ID')
    taxonomy = db.Column(db.Integer,nullable=False,default=1,comment='分类方法 1分类 2标签 3菜单')
    img = db.Column(db.String(100), nullable=False,comment="图像描叙",default="")
    parent = db.Column(db.Integer,nullable=False,comment='上级ID')
    count = db.Column(db.Integer,nullable=False,comment='文章数统计',default=0)
    postmetas = db.relationship('PostMeta', secondary=term_relationships, backref=db.backref('terms', lazy='dynamic'))


    @property
    def menu_url(self):
        id = self.id
        pm = self.postmetas
        if pm:
            result = []
            for v in pm:
                if v.meta_key == "termtaxonomy_menu_url_id":
                    result.append(v.meta_value)
            return result
        else:
            return []

    @menu_url.setter
    def menu_url(self,input_postmeta_menu_url):
        l = Link(
            name = input_postmeta_menu_url[1],
            link = input_postmeta_menu_url[0],
            slug = ""
        )
        db.session.add(l)
        db.session.flush()
        pm = PostMeta(
            meta_key="termtaxonomy_menu_url_id",
            meta_value= l.id
        )
        pm.terms = [self]
    @property
    def menu_category(self):
        id = self.id
        pm = self.postmetas
        if pm:
            result = []
            for v in pm:
                if v.meta_key == "termtaxonomy_menu_category_id":
                    result.append(v.meta_value)
            return result
        else:
            return []

    @menu_category.setter
    def menu_category(self,input_postmeta_menu_category):
        if len(input_postmeta_menu_category) > 0:
            for v in input_postmeta_menu_category:
                pm =  PostMeta(
                    meta_key="termtaxonomy_menu_category_id",
                    meta_value= v
                )
                pm.terms = [self]
    @property
    def menu_posts(self):
        id = self.id
        pm = self.postmetas
        if pm:
            result = []
            for v in pm:
                if v.meta_key == "termtaxonomy_menu_posts_id":
                    result.append(v.meta_value)
            return result
        else:
            return []

    @menu_posts.setter
    def menu_posts(self, input_postmeta_menu_posts):
        if len(input_postmeta_menu_posts) > 0:
            for v in input_postmeta_menu_posts:
                pm =  PostMeta(
                    meta_key="termtaxonomy_menu_posts_id",
                    meta_value= v
                )
                pm.terms = [self]

    @property
    def get_posts(self):
        ids = []
        if self.postmetas:
            for v in self.postmetas:
                if v.meta_key == "termtaxonomy_category_posts_id":
                    ids.append(v.meta_value)
        return ids

