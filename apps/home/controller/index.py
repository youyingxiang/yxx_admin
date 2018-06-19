from flask import Blueprint,render_template,g,abort,request,url_for
from apps.admin.model.posts import Posts
from apps.admin.model.term_taxonomy import TermTaxonomy
from apps.admin.form.comment import CommentForm
from apps.admin.model.comment import Comment
from sqlalchemy import or_,and_
from exts import db,cache
from think import restful
from ..common import make_cache_key
import time
bp = Blueprint('homeindex',__name__)


@bp.route('/')
@cache.cached(key_prefix=make_cache_key)
def index():
    get_page = request.args.get('page')
    if get_page is not None and get_page.isdigit() == True and int(get_page) > 1:
        page = int(get_page)
    else:
        page = 1
    p = Posts.query.filter(Posts.post_status==1).order_by('id desc').paginate(page, per_page=int(g.page_size))
    return render_template('/home/'+g.select_template+'/category.html',list=p)


@bp.route('/category/')
@bp.route('/category/<category>/')
@cache.cached(key_prefix=make_cache_key)
def category(category = None):
    try:
        if category is None:raise ValueError('not data goto 404')
        id = category.split('_')[0]
        t = TermTaxonomy.query.filter(TermTaxonomy.id == id).first()
        pids = t.get_posts
        get_page = request.args.get('page')
        if get_page is not None and get_page.isdigit() == True and int(get_page) > 1:
            page = int(get_page)
        else:
            page = 1
        p = Posts.query.filter(and_(Posts.id.in_(pids),Posts.post_status==1)).order_by('id desc').paginate(page, per_page=int(g.page_size))
        return render_template('/home/'+g.select_template+'/category.html',list=p,category_get=category)
    except Exception as e:
        abort(404)

@bp.route('/posts/')
@bp.route('/posts/<posts>/')
@cache.cached(key_prefix=make_cache_key)
def posts(posts = None):
    try:
        if posts is None:raise ValueError('not data goto 404')
        id = posts.split('_')[0]
        p = Posts.query.filter(and_(Posts.id == id,Posts.post_status==1)).first()
        prev_ = Posts.query.filter(and_(Posts.id > id,Posts.post_status==1)).order_by('id asc').first()
        next_ = Posts.query.filter(and_(Posts.id < id,Posts.post_status==1)).order_by('id desc').first()
        return render_template('/home/' + g.select_template + '/posts.html',data=p,prev_=prev_,next_=next_)
    except Exception as e:
        abort(404)

@bp.route('/label/')
@bp.route('/label/<label>/')
@cache.cached(key_prefix=make_cache_key)
def label(label = None):
    try:
        if category is None:raise ValueError('not data goto 404')
        id = label.split('_')[0]
        t = TermTaxonomy.query.filter(TermTaxonomy.id == id).first()
        pids = t.get_posts_label
        get_page = request.args.get('page')
        if get_page is not None and get_page.isdigit() == True and int(get_page) > 1:
            page = int(get_page)
        else:
            page = 1
        p = Posts.query.filter(and_(Posts.id.in_(pids),Posts.post_status==1)).order_by('id desc').paginate(page, per_page=int(g.page_size))
        return render_template('/home/'+g.select_template+'/category.html',list=p,label_get=label)
    except Exception as e:
        abort(404)

@bp.route('/ajax_commit_comment/',methods=['POST'])
def ajax_commit_comment():
    try:
        form = CommentForm(request.form)
        if form.validate():
            c = Comment(
                comment_content = request.form.get('comment_content'),
                post_id = request.form.get('post_id'),
                ip = request.remote_addr,
                create_time = time.time()
            )
            db.session.add(c)
            db.session.commit()
            return restful.success(message="评论成功")
        else:
            raise ValueError(form.get_err_one())
    except Exception as e:
        return restful.server_error(str(e))

@bp.route('/ajax_get_comments/')
def ajax_get_comments():
    id = request.args.get('post_id')
    get_page = request.args.get('page')
    if get_page is not None and get_page.isdigit() == True and int(get_page) > 1:
        page = int(get_page)
    else:
        page = 1
    comments = Comment.query.filter(Comment.post_id == id).order_by('id desc').limit(int(g.page_size)).offset((page-1)*int(g.page_size)).all()
    data = []
    if comments:
        for v in comments:
            data.append({"ip": v.ip, 'content': v.comment_content, 'time': v.create_time})
        return restful.success('请求成功！',data=data)
    else:
        return restful.server_error("没有更多内容加载了！")


