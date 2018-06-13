from exts import db
import time,json
from .postmeta import PostMeta
from .term_relationships import term_relationships
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
    def postmeta_menu_url(self):
        id = self.id
        pm = PostMeta.query.filter(and_(PostMeta.meta_key == 'termtaxonomy_menu_object')).all()
        if pm:
            result = []
            for v in pm:
                mv = json.loads(v.meta_value)
                if mv.get('type') == 'url':
                    result.append(v.id)
            return result
        else:
            return []

    @postmeta_menu_url.setter
    def postmeta_menu_url(self,input_postmeta_menu_url):
        menu_urls = self.postmeta_menu_url
        if menu_urls:
            PostMeta.query.filter(PostMeta.id.in_(menu_urls)).delete(synchronize_session=False)
        meta_value = {'value': input_postmeta_menu_url[0], 'title': input_postmeta_menu_url[1], 'type':'url', "order": 0}
        meta_value = json.dumps(meta_value)
        pm = PostMeta(
            meta_key= "termtaxonomy_menu_object",
            meta_value= meta_value
        )
        self.postmetas = [pm]
    @property
    def postmeta_menu_category(self):
        id = self.id
        pm = PostMeta.query.filter(and_(PostMeta.meta_key == 'termtaxonomy_menu_object')).all()
        if pm:
            result = []
            for v in pm:
                mv = json.loads(v.meta_value)
                if mv.get('type') == 'category':
                    result.append(v.id)
            return result
        else:
            return []

    @postmeta_menu_category.setter
    def postmeta_menu_category(self,input_postmeta_menu_category):
        menu_categorys = self.postmeta_menu_category
        if menu_categorys:
            PostMeta.query.filter(PostMeta.id.in_(menu_categorys)).delete(synchronize_session=False)
        pms = []
        for v in input_postmeta_menu_category:
            meta_value = {'value':v, 'title': "", 'type': 'category',"order": 0}
            meta_value = json.dumps(meta_value)
            pm = PostMeta(
                meta_key="termtaxonomy_menu_object",
                meta_value=meta_value
            )
            pms.append(pm)
        self.postmetas = pms
    @property
    def postmeta_menu_posts(self):
        id = self.id
        pm = PostMeta.query.filter(and_(PostMeta.meta_key == 'termtaxonomy_menu_object')).all()
        if pm:
            result = []
            for v in pm:
                mv = json.loads(v.meta_value)
                if mv.get('type') == 'posts':
                    result.append(v.id)
            return result
        else:
            return []

    @postmeta_menu_posts.setter
    def postmeta_menu_posts(self, input_postmeta_menu_posts):
        menu_posts = self.postmeta_menu_posts
        if menu_posts:
            PostMeta.query.filter(PostMeta.id.in_(menu_posts)).delete(synchronize_session=False)
        pms = []
        for v in input_postmeta_menu_posts:
            meta_value = {'value': v, 'title': "", 'type': 'posts', "order": 0}
            meta_value = json.dumps(meta_value)
            pm = PostMeta(
                meta_key="termtaxonomy_menu_object",
                meta_value=meta_value
            )
            pms.append(pm)
        self.postmetas = pms