from flask import session,g,request,redirect,url_for,render_template
from .controller.index import bp as h_index_bp
from apps.admin.model.term_taxonomy import TermTaxonomy
from .common import get_nav,by_k_get_sys_config
@h_index_bp.before_request
def before_request():
    get_select_template()
    get_page_size()
    pass

def get_select_template():
    '''
    获取后台设置的那个模版
    :return:
    '''
    name = by_k_get_sys_config("select_template").v
    g.select_template = name

def get_page_size():
    '''
    获取分页页数
    :return:
    '''
    name = by_k_get_sys_config("page_size").v
    g.page_size = name
@h_index_bp.context_processor
def common():
    name = by_k_get_sys_config("menu_master").v
    # 导航
    navs = get_nav(name)
    # 排名前 5 分类
    top_category = TermTaxonomy.query.filter(TermTaxonomy.taxonomy == 1).order_by('count desc').limit(5).offset(0).all()
    # 排名前 5 标签
    top_label = TermTaxonomy.query.filter(TermTaxonomy.taxonomy == 2).order_by('count desc').limit(5).offset(0).all()
    return {'navs':navs,'top_category':top_category,'top_label':top_label}

@h_index_bp.errorhandler(404)
def page_not_found(e):
    return render_template('/home/'+g.select_template+'/404.html'),404

@h_index_bp.errorhandler(500)
def server_error(e):
    return render_template('/home/'+g.select_template+'/500.html'), 500