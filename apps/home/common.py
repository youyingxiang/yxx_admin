# 公用函数文件
from apps.admin.model.term_taxonomy import TermTaxonomy
from apps.admin.model.terms import Terms
from apps.admin.model.link import Link
from apps.admin.model.posts import Posts
from apps.admin.model.config_field import ConfigField
from sqlalchemy import and_
from wtforms import Form
from exts import cache
from flask import request
class FormBase(Form):    
    def get_err_one(self):
        err = self.errors.popitem()[1][0]
        return err



def make_cache_key(*args, **kwargs):
    path = request.path
    args = str(hash(frozenset(request.args.items())))
    return (str(path) + args)


def get_nav(name):
    '''
    根据菜单名称 获取菜单
    :param name:
    :return:
    '''
    tm = Terms.query.filter(Terms.name == name).all()
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
                                result = {"name": n.terms[0].slug if n.terms[0].slug else n.terms[0].name, 'link':str(n.id)+'_'+n.terms[0].name,'type':'category','childs':n.get_childs}
                            # 3 关联文章
                            elif vv.meta_key == 'termtaxonomy_menu_posts_id':
                                n = Posts.query.filter(Posts.id == vv.meta_value).first()
                                result = {"name": n.post_name if n.post_name else n.post_title, 'link':str(n.id)+'_'+n.post_title,'type':'posts'}
                            navs.append(result)
    return navs

def by_k_get_sys_config(k):
    '''
    根据系统配置字段K  获取值
    :param name:
    :return:
    '''
    confs = get_sys_config()
    result = {}
    for v in confs:
        if v.k == k:
            result = v
    return result


@cache.cached(key_prefix='get_sys_config')
def get_sys_config():
    c = ConfigField.query.filter(ConfigField.state == 1).all()
    return c
