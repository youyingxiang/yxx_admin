from flask import Blueprint,render_template,views,request,g,url_for,abort
from ..model.posts import Posts
from ..model.term_taxonomy import TermTaxonomy
from ..model.resources import Resources
from ..model.postmeta import PostMeta
from ..model.terms import Terms
from sqlalchemy import and_,or_
from ..config import PAGE_SIZE
from ..common import reSort,write_log,get_str_upper
from think import restful
from exts import db
import time,os
from ..form.posts import PostExcerptForm,PostTitleForm,PostsForm,PostStatusForm
bp = Blueprint('adminposts',__name__,url_prefix='/admin/posts')

@bp.route('/index/')
def index():
    search = request.args.get('search')
    sort = request.args.get('_sort')
    where = ""
    if search is not None:
        where = or_(Posts.post_content.like("%"+search.strip()+"%"),Posts.post_title.like("%"+search.strip()+"%"))
        pass
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
    p = Posts.query.filter(where).order_by(order).paginate(page, per_page=PAGE_SIZE)
    return render_template('admin/posts/index.html',data = p)

class PostsAddView(views.MethodView):
    def get(self):
        # 获取分类
        categorys = TermTaxonomy.query.filter(TermTaxonomy.taxonomy == 1).all()
        categorys = reSort(categorys,parent=0,level=0,ret = [])
        #获取标签
        labels = TermTaxonomy.query.filter(TermTaxonomy.taxonomy == 2).order_by("count desc").all()
        labels_ = map(lambda data:data.terms[0].name,labels)
        return render_template('admin/posts/add.html',categorys=categorys,labels_=labels_)
    def post(self):
        form = PostsForm(request.form)
        try:
            if form.validate():
                posts = Posts(
                    post_author = g.admin.id,
                    create_time = time.time(),
                    post_content = request.form.get('post_content'),
                    post_title = request.form.get('post_title'),
                    post_excerpt = request.form.get('post_excerpt'),
                    post_status = request.form.get('post_status'),
                    comment_status = request.form.get('comment_status'),
                    post_name = request.form.get('post_name') if request.form.get('post_name') is not None else '' ,
                    update_time = time.time(),
                    menu_order = request.form.get('menu_order') if request.form.get('menu_order') is not None else 1,
                    post_type = 1,
                    comment_count = 0
                )
                db.session.add(posts)
                db.session.flush()
                # step1  看是否有特色图片
                if request.form.get('img') != "/static/global/face/default.png":
                    posts.feature_img = [request.form.get('img'),request.form.get('file_size'),request.form.get('old_name')]
                # 分类
                posts.category = request.form.getlist('category')
                # step3 标签
                posts.label = request.form.getlist('label')
                db.session.commit()
                write_log(log_type='add', log_detail='增加文章成功')
                return restful.success(message="操作成功", url=url_for('adminposts.index'))
            else:
                raise ValueError(form.get_err_one())
        except Exception as e:
            write_log(log_type='add', log_detail="行为：新增文章；错误：" + str(e))
            return restful.server_error(message=str(e))
        pass

class PostsEditView(views.MethodView):
    def get(self):
        posts_id = request.args.get('id')
        if posts_id is not None:
            postsinfo = Posts.query.get(posts_id)
            # 获取分类
            categorys = TermTaxonomy.query.filter(TermTaxonomy.taxonomy == 1).all()
            categorys = reSort(categorys, parent=0, level=0, ret=[])
            # 获取标签
            labels = TermTaxonomy.query.filter(TermTaxonomy.taxonomy == 2).order_by("count desc").all()
            labels_ = map(lambda data: data.terms[0].name, labels)
            return render_template('/admin/posts/edit.html', data=postsinfo,categorys=categorys,labels_=labels_)
        else:
            abort(404)
    def post(self):
        try:
            if len(request.form) == 2:
                for v in request.form:
                    if v != 'id':
                        v_old_name = v
                        object_name = get_str_upper(v, '_') + "Form"
                        form = eval(object_name)(request.form)
            else:
                form = PostsForm(request.form)
            if form.validate():
                posts = Posts.query.get(request.form.get('id'))
                if len(request.form) == 2:
                    setattr(posts,v_old_name,form.data[v_old_name])
                else:
                    posts.post_content = request.form.get('post_content')
                    posts.post_title = request.form.get('post_title')
                    posts.post_excerpt = request.form.get('post_excerpt')
                    posts.post_status = request.form.get('post_status')
                    posts.comment_status = request.form.get('comment_status')
                    posts.post_name = request.form.get('post_name') if request.form.get('post_name') else "";
                    posts.update_time = time.time(),
                    posts.menu_order = request.form.get('menu_order') if request.form.get('menu_order') else 0;
                    if request.form.get('img') != posts.feature_img and request.form.get('img') != '/static/global/face/default.png':
                        posts.feature_img = [request.form.get('img'),request.form.get('file_size'),request.form.get('old_name')]
                    # 分类
                    posts.category = request.form.getlist('category')
                    # step3 标签
                    posts.label = request.form.getlist('label')
                db.session.commit()
                write_log(log_type='add', log_detail='修改文章成功')
                return restful.success(message="操作成功", url=url_for('adminposts.index'))
            else:
                raise ValueError(form.get_err_one())
        except Exception as e:
            write_log(log_type='edit', log_detail="行为：修改文章；错误：" + str(e))
            return restful.server_error(message=str(e))

@bp.route('/delete/',methods=['POST'])
def delete():
    ids = request.form.get('id')
    try:
        if id is not None:
            res = Posts.query.filter(Posts.id.in_(ids.split(','))).delete(synchronize_session=False)
            mks = ['termtaxonomy_category_posts_id','feature_img_resources_posts_id','feature_img_resources_posts_id']
            pms = PostMeta.query.filter(or_(PostMeta.meta_key.in_(mks),PostMeta.meta_value.in_(ids))).all()
            if pms:
                for v in pms:
                    if v.terms.all():
                        for vv in v.terms.all():
                            vv.count -= 1
                        v.terms = []
                        v.resources = []
                    db.session.delete(v)
            db.session.commit()
            write_log(log_type='delete', log_detail='删除文章成功')
            return restful.success('删除成功！', url=url_for('adminposts.index'))
    except Exception as e:
        write_log(log_type='delete', log_detail="行为：删除文章；错误：" + str(e))
        return restful.server_error(message=str(e))
    pass

@bp.route('/ajax_get_posts/',methods=['POST'])
def ajax_get_posts():
    order = "id asc"
    get_page = request.form.get('page')
    if get_page is not None and get_page.isdigit() == True and int(get_page) > 1:
        page = int(get_page)
    else:
        page = 1
    p = db.session.query(Posts.id,Posts.post_title).filter(Posts.post_status == 1).order_by(order).limit(PAGE_SIZE).offset((page-1)*PAGE_SIZE).all()
    if p:
        return restful.success('请求成功！',data=p)
    else:
        return restful.server_error("没有更多内容加载了！")

bp.add_url_rule('/add/',view_func=PostsAddView.as_view('add'))
bp.add_url_rule('/edit/',view_func=PostsEditView.as_view('edit'))