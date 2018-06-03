from flask import Blueprint,views,render_template,request,url_for,abort
from apps.admin.model.config_field import ConfigField
from sqlalchemy import or_,and_
from exts import db
from think import restful
from ..common import get_str_upper,write_log
from ..form.config_field import Config_FieldForm,KForm,VForm,TypeForm,TexttypeForm,SortsForm,StateForm,DescForm
import time
from ..config import PAGE_SIZE
bp = Blueprint('adminconfig_field',__name__,url_prefix='/admin/config_field')

class ConfigFieldAddView(views.MethodView):
    def get(self):
        return render_template('/admin/config_field/add.html')
    def post(self):
        form = Config_FieldForm(request.form)
        if form.validate():
            try:
                c = ConfigField(
                    v = request.form.get('v'),
                    k = request.form.get('k'),
                    desc = request.form.get('desc'),
                    prompt = request.form.get('prompt'),
                    sorts = request.form.get('sorts'),
                    state = request.form.get('state'),
                    texttype = request.form.get('texttype'),
                    textvalue = request.form.get('textvalue'),
                    type=request.form.get('type'),
                    create_time=time.time(),
                )
                db.session.add(c)
                db.session.commit()
                write_log(log_type='add', log_detail='增加配置字段成功')
                return restful.success(message="操作成功", url=url_for('adminconfig_field.index'))
            except Exception as e:
                write_log(log_type='add', log_detail='增加配置字段失败')
                return restful.server_error(message=str(e))
        else:
            write_log(log_type='add', log_detail='增加配置字段失败')
            return restful.params_error(message=form.get_err_one())
        pass

class ConfigFieldEditView(views.MethodView):
    def get(self):
        id = request.args.get('id')
        if id is not None:
            cfinfo = ConfigField.query.get(id)
            return render_template('/admin/config_field/edit.html', data=cfinfo)
        else:
            abort(404)
    def post(self):
        if len(request.form) == 2:
            for v in request.form:
                if v != 'id':
                    object_name = get_str_upper(v, '_') + "Form"
                    form = eval(object_name)(request.form)
        else:
            form = Config_FieldForm(request.form)
        if form.validate():
            try:
                cf = ConfigField.query.get(request.form.get('id'))
                if request.form.get('v') is not None: cf.v = request.form.get('v')
                if request.form.get('k') is not None: cf.k = request.form.get('k')
                if request.form.get('desc') is not None: cf.desc = request.form.get('desc')
                if request.form.get('prompt') is not None: cf.prompt = request.form.get('prompt')
                if request.form.get('sorts') is not None: cf.sorts = request.form.get('sorts')
                if request.form.get('state') is not None: cf.state = request.form.get('state')
                if request.form.get('texttype') is not None: cf.texttype = request.form.get('texttype')
                if request.form.get('textvalue') is not None: cf.textvalue = request.form.get('textvalue')
                if request.form.get('type') is not None: cf.type = request.form.get('type')
                db.session.commit()
                write_log(log_type='edit', log_detail='修改配置字段成功')
                return restful.success(message="操作成功", url=url_for('adminconfig_field.index'))
            except Exception as e:
                write_log(log_type='edit', log_detail='修改配置字段失败')
                return restful.server_error(message=str(e))
        else:
            write_log(log_type='edit', log_detail='修改配置字段失败')
            return restful.params_error(message=form.get_err_one())
        pass

@bp.route('/index/',methods=['POST','GET'])
def index():
    search = request.args.get('search')
    sort = request.args.get('_sort')
    where = ""
    if search is not None:
        where = or_(ConfigField.k.like("%" + search.strip() + "%"), ConfigField.v.like("%" + search.strip() + "%"),
                    ConfigField.desc.like("%" + search.strip() + "%"),ConfigField.type.like("%" + search.strip() + "%"))
    if sort is not None:
        order = sort.split(',')
        order = order[0]+' '+order[1]
    else:
        order = "id asc"
    get_page = request.args.get('page')
    if get_page is not None and get_page.isdigit() == True and int(get_page) > 1:
        page = int(get_page)
    else:
        page = 1
    cfs = ConfigField.query.filter(where).order_by(order).paginate(page, per_page=PAGE_SIZE)
    return render_template('/admin/config_field/index.html', data=cfs)

@bp.route('/web/',methods=['GET'])
def web():
    '''
    网站设置
    :return:
    '''
    type = 'web'
    order = "id desc"
    where = and_(ConfigField.state == 1, ConfigField.type == type)
    cfs = ConfigField.query.filter(where).order_by(order).all()
    if len(cfs) < 1:
        abort(404)
    return render_template('/admin/config_field/common.html', data=cfs, type=type)

@bp.route('/up/',methods=['GET'])
def up():
    '''
    上传设置
    :return:
    '''
    type = 'up'
    order = "id desc"
    where = and_(ConfigField.state == 1, ConfigField.type == type)
    cfs = ConfigField.query.filter(where).order_by(order).all()
    if len(cfs) < 1:
        abort(404)
    return render_template('/admin/config_field/common.html', data=cfs, type=type)

@bp.route('/delete/',methods=['POST'])
def delete():
    ids = request.form.get('id')
    try:
        if id is not None:
            res = ConfigField.query.filter(ConfigField.id.in_(ids.split(','))).delete(synchronize_session=False)
            db.session.commit()
            write_log(log_type='delete', log_detail='删除配置字段成功')
            return restful.success('删除成功！',url=url_for('adminconfig_field.index'))
    except Exception as e:
        write_log(log_type='delete',log_detail='删除配置字段失败')
        return restful.server_error(message=str(e))
    pass
@bp.route('/save/',methods=['POST'])
def save():
    type = request.form.get('type')
    if type is not None:
        data = request.form.to_dict()
        data.pop('type')
        try:
            for v in data:
                if data.get(v) is not None:
                    cf = ConfigField.query.filter(ConfigField.k == v).first()
                    cf.v = data.get(v)
                    db.session.commit()
            write_log(log_type='delete', log_detail='修改配置字段成功')
            return restful.success('修改成功！', url=url_for('adminconfig_field.'+type))
        except Exception as e:
            write_log(log_type='delete', log_detail='修改配置字段失败')
            return restful.server_error(message=str(e))
    else:
        abort(404)

bp.add_url_rule('/add/',view_func=ConfigFieldAddView.as_view('add'))
bp.add_url_rule('/edit/',view_func=ConfigFieldEditView.as_view('edit'))