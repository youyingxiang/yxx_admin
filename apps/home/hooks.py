from flask import session,g,request,redirect,url_for,render_template
from .controller.index import bp as h_index_bp
from apps.admin.model.term_taxonomy import TermTaxonomy
from apps.admin.model.terms import Terms
from apps.admin.model.link import Link
from apps.admin.model.posts import Posts
from sqlalchemy import and_
@h_index_bp.before_request
def before_request():
    pass


@h_index_bp.context_processor
def nav():
    tm = Terms.query.filter(Terms.name=="主界面菜单").all()
    navs = []
    if tm:
        for v in tm:
            # 3代表菜单
            if v.term_taxonomy.taxonomy == 3:
                # 判断菜单有没有关联
                if v.term_taxonomy.postmetas:
                        for vv in v.term_taxonomy.postmetas:
                            # 1 关联链接
                            if vv.meta_key == 'termtaxonomy_menu_url_id':
                                n = Link.query.filter(Link.id == vv.meta_value).first()
                                result = {"name":n.name,'link':n.link,'type':'url'}
                            # 2 关联分类
                            elif vv.meta_key == 'termtaxonomy_menu_category_id':
                                n = TermTaxonomy.query.filter(TermTaxonomy.id == vv.meta_value).first()
                                childs = Posts.query.filter(and_(Posts.id.in_(n.get_posts),Posts.post_status == 1)).order_by('id desc').all()
                                result = {"name": n.terms[0].slug if n.terms[0].slug else n.terms[0].name, 'link': "",'type':'category','childs':childs}
                            # 3 关联文章
                            elif vv.meta_key == 'termtaxonomy_menu_posts_id':
                                n = Posts.query.filter(Posts.id == vv.meta_value).first()
                                result = {"name": n.post_name if n.post_name else n.post_title, 'link': n.id,'type':'posts'}
                            navs.append(result)
    return {'navs':navs}