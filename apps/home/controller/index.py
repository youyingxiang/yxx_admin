from flask import Blueprint,render_template,g,abort,request
from apps.admin.model.posts import Posts
from apps.admin.model.term_taxonomy import TermTaxonomy
from sqlalchemy import or_
bp = Blueprint('homeindex',__name__)

@bp.route('/')
def index():
    get_page = request.args.get('page')
    if get_page is not None and get_page.isdigit() == True and int(get_page) > 1:
        page = int(get_page)
    else:
        page = 1
    p = Posts.query.order_by('id desc').paginate(page, per_page=int(g.page_size))
    return render_template('/home/'+g.select_template+'/category.html',list=p)


@bp.route('/category/')
@bp.route('/category/<category>/')
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
        p = Posts.query.filter(Posts.id.in_(pids)).order_by('id desc').paginate(page, per_page=int(g.page_size))
        return render_template('/home/'+g.select_template+'/category.html',list=p,category_get=category)
    except Exception as e:
        abort(404)

@bp.route('/posts/')
@bp.route('/posts/<posts>/')
def posts(posts = None):
    try:
        if posts is None:raise ValueError('not data goto 404')
        id = posts.split('_')[0]
        p = Posts.query.filter(Posts.id == id).first()
        prev_ = Posts.query.filter(Posts.id > id).order_by('id asc').first()
        next_ = Posts.query.filter(Posts.id < id).order_by('id desc').first()
        return render_template('/home/' + g.select_template + '/posts.html',data=p,prev_=prev_,next_=next_)
    except Exception as e:
        abort(404)

@bp.route('/label/')
@bp.route('/label/<label>/')
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
        p = Posts.query.filter(Posts.id.in_(pids)).order_by('id desc').paginate(page, per_page=int(g.page_size))
        return render_template('/home/'+g.select_template+'/category.html',list=p,label_get=label)
    except Exception as e:
        abort(404)


