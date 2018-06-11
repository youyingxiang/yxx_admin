from flask import Blueprint,render_template,views,request,g,url_for
from ..model.posts import Posts
from ..model.term_taxonomy import TermTaxonomy
from ..model.resources import Resources
from ..model.postmeta import PostMeta
from ..model.terms import Terms
from sqlalchemy import and_,or_
from ..config import PAGE_SIZE
from ..common import reSort,write_log
from think import restful
from exts import db
import time
from ..form.posts import PostExcerpt,PostTitle,PostsForm
bp = Blueprint('adminposts',__name__,url_prefix='/admin/posts')

@bp.route('/index/')
def index():
    search = request.args.get('search')
    sort = request.args.get('_sort')
    where = ""
    if search is not None:
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
        labels_ = []
        for v in labels:
            labels_.append(v.terms[0].name)
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
                if request.form.get('img'):
                    resour = Resources(
                        old_name = request.form.get('old_name'),
                        size = request.form.get('file_size'),
                        new_name = request.form.get('img')
                    )
                    # posts_meta 操作
                    postsm = PostMeta(
                        meta_key = "feature_img_resources_posts_id",
                        meta_value = posts.id
                    )
                    # posts_meta 与 resources关联
                    resour.postmetas = [postsm]
                    db.session.add(resour)
                    db.session.flush()
                # step2 查看是否有分类
                category = request.form.getlist('category')
                if len(category) > 0:
                    # posts_meta 操作
                    postsm = PostMeta(
                        meta_key="termtaxonomy_category_posts_id",
                        meta_value=posts.id
                    )
                    tt = TermTaxonomy.query.filter(TermTaxonomy.id.in_(category)).all()
                    postsm.terms = tt
                    db.session.add(postsm)
                    db.session.flush()
                # 标签
                label = request.form.getlist('label')
                if len(label) > 0:
                    # posts_meta 操作
                    postsm = PostMeta(
                        meta_key="termtaxonomy_label_posts_id",
                        meta_value=posts.id
                    )
                    tm = Terms.query.filter(Terms.name.in_(label)).all()
                    tt = map(lambda data:data.term_taxonomy,tm)
                    postsm.terms = list(tt)
                    db.session.add(postsm)
                    db.session.flush()
                db.session.commit()
                write_log(log_type='add', log_detail='增加文章成功')
                return restful.success(message="操作成功", url=url_for('adminposts.add'))
            else:
                raise ValueError(form.get_err_one())
        except Exception as e:
            write_log(log_type='add', log_detail="行为：新增文章；错误：" + str(e))
            return restful.server_error(message=str(e))
        pass

class PostsEditView(views.MethodView):
    def get(self):
        return render_template('admin/posts/edit.html')
        pass
    def post(self):
        pass

@bp.route('/delete/',methods=['POST'])
def delete():
    pass

bp.add_url_rule('/add/',view_func=PostsAddView.as_view('add'))
bp.add_url_rule('/edit/',view_func=PostsEditView.as_view('edit'))