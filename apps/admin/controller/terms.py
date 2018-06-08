from flask import Blueprint,render_template,views,render_template,request,url_for,abort
from ..model.terms import Terms,TermTaxonomy
from ..common import get_str_upper,write_log
from ..config import PAGE_SIZE,TAXONOMY,TAXONOMY_CN
from think import restful
from sqlalchemy import or_
from ..form.terms import TermsForm
from exts import db
bp = Blueprint('adminterms',__name__,url_prefix='/admin/terms')

class TermsAddView(views.MethodView):
    #decorators = [login_required]
    def get(self):
        taxonomy = request.args.get('taxonomy')
        id = request.args.get('id')
        if taxonomy is None:
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
            return render_template('admin/terms/edit.html',data=terms,taxonomy=taxonomy,page_title=TAXONOMY_CN.get(taxonomy),get_taxonomy_id = TAXONOMY.get(taxonomy),info=t)
        pass
    def post(self):
        try:
            taxonomy = request.args.get('taxonomy')
            if taxonomy is None:raise ValueError('参数错误！')
            form = TermsForm(request.form)
            if form.validate():
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
                    parent=0,
                    count=0)
                db.session.commit()
                write_log(log_type='add', log_detail='增加'+TAXONOMY_CN.get(taxonomy)+'成功')
                return restful.success(message="操作成功", url=url_for('adminterms.add',taxonomy=taxonomy))
            else:
                raise ValueError(form.get_err_one())
        except Exception as e:
            write_log(log_type='add', log_detail="行为：新增"+TAXONOMY_CN.get(taxonomy)+"；错误：" + str(e))
            return restful.server_error(message=str(e))


@bp.route('/delete/',methods=['GET'])
def delete():
    pass

bp.add_url_rule('/add/',view_func=TermsAddView.as_view('add'))