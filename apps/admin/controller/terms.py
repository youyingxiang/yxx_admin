from flask import Blueprint,render_template,views,render_template,request,url_for,abort
from ..model.terms import Terms
from ..model.term_taxonomy import TermTaxonomy
from ..model.postmeta import PostMeta
from ..model.posts import Posts
from ..model.link import Link
from ..common import get_str_upper,write_log,reSort,getChildren
from ..config import PAGE_SIZE,TAXONOMY,TAXONOMY_CN
from think import restful
from sqlalchemy import or_,and_
from ..form.terms import TermsForm,NameForm
from exts import db
import json
bp = Blueprint('adminterms',__name__,url_prefix='/admin/terms')

class TermsEditView(views.MethodView):
    #decorators = [login_required]
    def get(self):
        taxonomy = request.args.get('taxonomy')
        id = request.args.get('id')
        if taxonomy is None or taxonomy not in TAXONOMY.keys() :
            abort(404)
        else:
            search = request.args.get('search')
            sort = request.args.get('_sort')
            where = ""
            if search is not None:
                where = or_(Terms.name.like("%" + search.strip() + "%"),
                            Terms.slug.like("%" + search.strip() + "%"))
            if sort is not None:
                order = sort.split(',')
                order = order[0] + ' ' + order[1]
            else:
                order = "id asc"
            get_page = request.args.get('page')
            if get_page is not None and get_page.isdigit() == True and int(get_page) > 1:
                page = int(get_page)
            else:
                page = 1
            t = {}
            if id is not None:
                t = Terms.query.get(id)
            terms = Terms.query.filter(where).order_by(order).paginate(page, per_page=PAGE_SIZE)
            parentData = []
            if taxonomy != "post_tag":
                parentData = TermTaxonomy.query.filter(TermTaxonomy.taxonomy == TAXONOMY.get(taxonomy)).order_by(order).all()
                parentData = reSort(parentData,parent=0,level=0,ret = [])
            return render_template('admin/terms/edit.html',data=terms,taxonomy=taxonomy,page_title=TAXONOMY_CN.get(taxonomy),
                                   get_taxonomy_id = TAXONOMY.get(taxonomy),info=t,parentData=parentData)
        pass

    def post(self):
        try:
            taxonomy = request.args.get('taxonomy')
            if taxonomy is None:raise ValueError('参数错误！')
            form = TermsForm(request.form)
            if form.validate():
                if request.form.get('id'):
                    t = Terms.query.get(request.form.get('id'))
                    if request.form.get('name') is not None:t.name = request.form.get('name')
                    if request.form.get('slug') is not None: t.slug = request.form.get('slug')
                    term_taxonomy = TermTaxonomy.query.filter(TermTaxonomy.term_id == t.id).one()
                    if request.form.get('img') is not None:term_taxonomy.img = request.form.get('img')
                    if request.form.get('parent') is not None:term_taxonomy.parent = request.form.get('parent')
                    t.term_taxonomy = term_taxonomy
                    db.session.commit()
                else:
                    t = Terms(
                        name = request.form.get('name'),
                        slug = request.form.get('slug'),
                        term_order = 99
                    )
                    db.session.add(t)
                    db.session.flush()
                    t.term_taxonomy = TermTaxonomy(
                        term_id=t.id,
                        taxonomy=TAXONOMY.get(taxonomy),
                        img = request.form.get('img') if request.form.get('img') is not None else "",
                        parent = int(request.form.get('parent')) if request.form.get('parent') is not None else 0,
                        count=0)
                    db.session.commit()
                if request.form.get('id'):
                    log_type = 'edit'
                    log_detail = '修改' + TAXONOMY_CN.get(taxonomy) + '成功'
                else:
                    log_type = 'add'
                    log_detail = '新增' + TAXONOMY_CN.get(taxonomy) + '成功'
                write_log(log_type=log_type, log_detail=log_detail)
                return restful.success(message="操作成功", url=url_for('adminterms.edit',taxonomy=taxonomy))
            else:
                raise ValueError(form.get_err_one())
        except Exception as e:
            if request.form.get('id'):
                log_type = "edit"
                log_detail = "行为：修改"+TAXONOMY_CN.get(taxonomy)+"；错误：" + str(e)
            else:
                log_type = "add"
                log_detail = "行为：新增" + TAXONOMY_CN.get(taxonomy) + "；错误：" + str(e)
            write_log(log_type=log_type, log_detail=log_detail)
            return restful.server_error(message=str(e))


@bp.route('/delete/',methods=['GET','POST'])
def delete():
    ids = request.form.get('id')
    taxonomy = request.args.get('taxonomy')
    try:
        if id is not None:
            if taxonomy == 'post_tag':
                Terms.query.filter(Terms.id.in_(ids.split(','))).delete(synchronize_session=False)
                TermTaxonomy.query.filter(TermTaxonomy.term_id.in_(ids.split(','))).delete(synchronize_session=False)
                db.session.commit()
            elif taxonomy == 'category':
                for id_ in ids.split(','):
                    tt = TermTaxonomy.query.filter(TermTaxonomy.taxonomy == 1).all()
                    ids = getChildren(tt,int(id_),ret = [])
                    ids.append(int(id_))
                    ids_ = db.session.query(TermTaxonomy.term_id).filter(TermTaxonomy.id.in_(ids)).all()
                    ids_ = list(map(lambda data:data[0],ids_))
                    TermTaxonomy.query.filter(TermTaxonomy.id.in_(ids_)).delete(
                        synchronize_session=False)
                    Terms.query.filter(Terms.id.in_(ids)).delete(synchronize_session=False)
                    db.session.commit()
            write_log(log_type='delete', log_detail='删除'+TAXONOMY_CN.get(taxonomy)+'成功')
            return restful.success('删除成功！', url=url_for('adminterms.edit',taxonomy=taxonomy))
    except Exception as e:
        write_log(log_type='delete', log_detail="行为：删除"+TAXONOMY_CN.get(taxonomy)+"；错误：" + str(e))
        return restful.server_error(message=str(e))
    pass


class TermsMenuView(views.MethodView):
    def get(self):
        id = request.args.get('id')
        menus = TermTaxonomy.query.filter(TermTaxonomy.taxonomy == 3).all()
        if id is None:
            select_menu = menus[0]
        else:
            select_menu = TermTaxonomy.query.get(id)
        if select_menu is None:
            abort(404)
        # 获取分类
        categorys = TermTaxonomy.query.filter(TermTaxonomy.taxonomy == 1).all()
        categorys = reSort(categorys, parent=0, level=0, ret=[])
        menu_result = get_menu(select_menu.postmetas)
        return render_template('admin/terms/menu.html',menus = menus,select_menu=select_menu,categorys = categorys,menu_result = menu_result)

@bp.route('/ajax_add_label/',methods=['POST'])
def ajax_add_label():
    form = NameForm(request.form)
    try:
        if form.validate():
            name = request.form.get('name')
            res = db.session.query(TermTaxonomy,Terms).filter(and_(TermTaxonomy.taxonomy == 2,Terms.name == name,TermTaxonomy.term_id==Terms.id )).all()
            # 没有当前标签
            if len(res) == 0:
                t = Terms(
                    name = request.form.get('name'),
                    slug = request.form.get('name'),
                    term_order=99
                )
                db.session.add(t)
                db.session.flush()
                t.term_taxonomy = TermTaxonomy(
                    term_id=t.id,
                    taxonomy = 2,
                    img = "",
                    parent= 0,
                    count=0)
                db.session.commit()
            write_log(log_type='add', log_detail='添加标签成功')
            return restful.success('添加成功')
        else:
            raise ValueError(form.get_err_one())
    except Exception as e:
        write_log(log_type='add', log_detail="行为：添加标签；错误：" + str(e))
        return restful.server_error(message=str(e))

@bp.route('/ajax_add_menu/',methods=['POST'])
def ajax_add_menu():
    form = NameForm(request.form)
    try:
        if form.validate():
            name = request.form.get('name')
            res = db.session.query(TermTaxonomy,Terms).filter(and_(TermTaxonomy.taxonomy == 3,Terms.name == name,TermTaxonomy.term_id==Terms.id )).all()
            #没有当前菜单
            if any(res) == False:
                t = Terms(
                    name = request.form.get('name'),
                    slug = request.form.get('name'),
                    term_order=99
                )
                db.session.add(t)
                db.session.flush()
                t.term_taxonomy = TermTaxonomy(
                    term_id=t.id,
                    taxonomy = 3,
                    img = "",
                    parent= 0,
                    count=0)
                db.session.commit()
            write_log(log_type='add', log_detail='添加菜单成功')
            return restful.success('添加成功',data={"id":t.term_taxonomy.id,"name":t.name})
        else:
            raise ValueError(form.get_err_one())
    except Exception as e:
        write_log(log_type='add', log_detail="行为：添加菜单；错误：" + str(e))
        return restful.server_error(message=str(e))
    pass

@bp.route('/ajax_join_menu/',methods=['POST'])
def ajax_join_menu():
    try:
        menu_id = request.form.get('id')
        menu_value = request.form.getlist('value[]')
        menu_type = request.form.get('type')
        #获取菜单
        tm = TermTaxonomy.query.filter(TermTaxonomy.id == menu_id).first()
        if tm:
            if menu_type == 'url':
                tm.menu_url = menu_value
            elif menu_type == 'category':
                tm.menu_category = menu_value
            elif menu_type == 'posts':
                tm.menu_posts = menu_value
            db.session.commit()
        return restful.success('关联菜单成功',url=url_for('adminterms.menu'))
    except Exception as e:
        write_log(log_type='join', log_detail="行为：菜单关联；错误：" + str(e))
        return restful.server_error(str(e))

@bp.route('/ajax_unjoin_menu/',methods = ['POST'])
def ajax_unjoin_menu():
    try:
        pm_id = request.form.get('id')
        join_object = PostMeta.query.filter(PostMeta.id==pm_id).first()
        join_object.terms = []
        db.session.delete(join_object)
        db.session.commit()
        return restful.success('取消菜单关联成功', url=url_for('adminterms.menu'))
    except Exception as e:
        write_log(log_type='join', log_detail="行为：取消菜单关联；错误：" + str(e))
        return restful.server_error(str(e))

@bp.route('/ajax_terms_slug/',methods = ['POST'])
def ajax_terms_slug():
    try:
        id = request.form.get('id')
        type = request.form.get('type')
        value = request.form.get('new_name')
        if type == 'category':
            c = TermTaxonomy.query.get(id)
            c.terms[0].slug = value
        elif type == 'posts':
            p = Posts.query.get(id)
            p.post_name = value
        elif type == 'url':
            l = Link.query.get(id)
            l.slug = value
        db.session.commit()
        return restful.success('编辑成功')
    except Exception as e:
        return restful.server_error(str(e))
def get_menu(menu_postmetas):
    menu_result = []
    for v in menu_postmetas:
        d = {}
        if v.meta_key == 'termtaxonomy_menu_url_id':
            l = Link.query.filter(Link.id == v.meta_value).first()
            d['type'] = '自定义链接'
            d['type_en'] = "url"
            d['title'] = l.name
            if l.slug:
                d['slug'] = l.slug
            else:
                d['slug'] = l.name
            d['id'] = l.id
        elif v.meta_key == 'termtaxonomy_menu_posts_id':
            p = Posts.query.filter(Posts.id == v.meta_value).first()
            d['type'] = '文章'
            d['type_en'] = "posts"
            d['title'] = p.post_title
            if p.post_name:
                d['slug'] = p.post_name
            else:
                d['slug'] = p.post_title
            d['id'] = p.id
        elif v.meta_key == 'termtaxonomy_menu_category_id':
            c = TermTaxonomy.query.filter(TermTaxonomy.id == v.meta_value).first()
            d['type'] = '分类'
            d['type_en'] = "category"
            d['title'] = c.terms[0].name
            if c.terms[0].slug:
                d['slug'] = c.terms[0].slug
            else:
                d['slug'] = c.terms[0].name
            d['id'] = c.id
        d['pm_id'] = v.id
        menu_result.append(d)
    return menu_result
bp.add_url_rule('/edit/',view_func=TermsEditView.as_view('edit'))
bp.add_url_rule('/menu/',view_func=TermsMenuView.as_view('menu'))