from exts import db
import time,os
from .admin import Admin
from .postmeta import PostMeta
from .terms import Terms
from .term_taxonomy import TermTaxonomy
from .resources import Resources
from sqlalchemy import and_
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

    @property
    def update_time(self):
        update_time_value = time.strftime("%Y-%m-%d %H:%M:%S", time.localtime(self._update_time))
        return update_time_value

    @update_time.setter
    def update_time(self, input_update_time):
        self._update_time = input_update_time

    @property
    def label(self):
        id = self.id
        pm = PostMeta.query.filter(and_(PostMeta.meta_key == 'termtaxonomy_label_posts_id',PostMeta.meta_value==id)).first()
        if pm:
            labels = pm.terms.all()
            labels = map(lambda data:data.terms[0].name,labels)
            return ",".join(list(labels))
        else:
            return ""

    @label.setter
    def label(self,input_label):
        id = self.id
        pm = PostMeta.query.filter(and_(PostMeta.meta_key == 'termtaxonomy_label_posts_id', PostMeta.meta_value == id)).first()
        # 一个标签都没有的情况
        if pm is None:
            pm = PostMeta(
                meta_key="termtaxonomy_label_posts_id",
                meta_value=id
            )
        for v in pm.terms:
            v.count -= 1
        tm = Terms.query.filter(Terms.name.in_(input_label)).all()
        tt = []
        if tm:
            tt = list(map(lambda data: data.term_taxonomy, tm))
            tt = list(filter(lambda data: True if data.taxonomy == 2 else False, tt))
            for v in tt:
                tt[tt.index(v)].count = v.count + 1
        pm.terms = tt

    @property
    def category(self):
        id = self.id
        pm = PostMeta.query.filter(and_(PostMeta.meta_key == 'termtaxonomy_category_posts_id', PostMeta.meta_value == id)).first()
        if pm:
            cate = pm.terms.all()
            cate = map(lambda data: data.terms[0].name, cate)
            return ",".join(list(cate))
        else:
            return ""

    @category.setter
    def category(self,input_category):
        id = self.id
        pm = PostMeta.query.filter(and_(PostMeta.meta_key == 'termtaxonomy_category_posts_id', PostMeta.meta_value == id)).first()
        if pm is None:
            pm = PostMeta(
                meta_key="termtaxonomy_category_posts_id",
                meta_value= id
            )
        tt = TermTaxonomy.query.filter(TermTaxonomy.id.in_(input_category)).all()
        for v in pm.terms:
            v.count -= 1
        if tt:
            for v in tt:
                tt[tt.index(v)].count = v.count + 1
        pm.terms = tt
    @property
    def feature_img(self):
        id = self.id
        pm = PostMeta.query.filter(and_(PostMeta.meta_key == 'feature_img_resources_posts_id', PostMeta.meta_value == id)).first()
        if pm:
            fi = pm.resources.all()
            fi = map(lambda data: data.new_name, fi)
            return ",".join(list(fi))
        else:
            return ""

    @feature_img.setter
    def feature_img(self,input_feature_img_info):
        id = self.id
        pm = PostMeta.query.filter(and_(PostMeta.meta_key == 'feature_img_resources_posts_id', PostMeta.meta_value == id)).first()
        if pm is None :
            # posts_meta 操作
            pm = PostMeta(
                meta_key="feature_img_resources_posts_id",
                meta_value=id
            )
            resour = Resources(
                new_name = input_feature_img_info[0] if input_feature_img_info[0] else "",
                size = input_feature_img_info[1] if input_feature_img_info[1] else 0,
                old_name = input_feature_img_info[2] if input_feature_img_info[2] else "",
            )
            resour.postmetas = [pm]
            db.session.add(resour)
            db.session.flush()
        else:
            imginfo = pm.resources.first()
            basepath = os.path.abspath(os.path.join(os.path.dirname(__file__), '..', '..', '..'))
            path = basepath+self.feature_img
            ### 删除原先的图片
            if os.path.exists(path):
                if os.path.isfile(path):
                    os.remove(path)
            imginfo.new_name = input_feature_img_info[0] if input_feature_img_info[0] else "",
            imginfo.size = input_feature_img_info[1] if input_feature_img_info[1] else 0
            imginfo.old_name = input_feature_img_info[2] if input_feature_img_info[2] else ""


