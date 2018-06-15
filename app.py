from flask import Flask
from apps.admin.controller.terms import bp as admintermsbp
from apps.admin.controller.posts import bp as adminpostsbp
from apps.admin.controller.file_manage import bp as adminfile_managebp
from apps.admin.controller.database import bp as admindatabasebp
from apps.admin.controller.log import bp as adminlogbp
from apps.admin.controller.config_field import bp as adminconfig_fieldbp
from apps.admin.controller.upload import bp as adminuploadbp
from apps.admin.controller.index import bp as adminindexbp
from apps.common.controller.tool import bp as commontoolbp
import config,apps.admin.hooks,os,datetime,apps.home.hooks
import logging
from exts import db,cache
from flask_session import Session
from apps.home.controller.index import bp as homeindexbp
from apps.admin.controller.login import bp as adminloginbp
from apps.admin.controller.role import bp as adminrolebp
from apps.admin.controller.admin import bp as adminadminbp


# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # from think.library.build import Build
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # Build().run()
app = Flask(__name__)
app.register_blueprint(admintermsbp)
app.register_blueprint(adminpostsbp)
app.register_blueprint(adminfile_managebp)
app.register_blueprint(admindatabasebp)
app.register_blueprint(adminlogbp)
app.register_blueprint(adminconfig_fieldbp)
app.register_blueprint(adminuploadbp)
app.register_blueprint(adminindexbp)
app.register_blueprint(commontoolbp)
app.config.from_object(config)
app.register_blueprint(homeindexbp)
app.register_blueprint(adminloginbp)
app.register_blueprint(adminrolebp)
app.register_blueprint(adminadminbp)
Session(app)

cache.init_app(app)
db.init_app(app)

@app.template_global('table_sort')
def table_sort(param):
    '''
        所有蓝图公用的点击排序
    :param param:排序的字段
    :return:
    '''
    param = str(param)
    from flask import request
    url_path = request.path
    faStr = 'fa-sort'
    get = request.args.to_dict()
    if '_pjax' in get:
        get.pop('_pjax')
    if '_sort' in get:
        sortArr = get.get('_sort').split(',')
        if sortArr[0] == param:
            if sortArr[1] == 'asc':
                faStr = 'fa-sort-asc'
                sort = 'desc'
            elif sortArr[1] == 'desc':
                faStr = 'fa-sort-desc'
                sort = 'asc'
            get['_sort'] = param+','+sort
        else:
            get['_sort'] = param+',asc'
    else:
        get['_sort'] = param+ ',asc'
    paramStr = [];
    for v in get:
        paramStr.append(v+'='+get[v])
    paramStrs = "&".join(paramStr)
    url_path = url_path + '?' + paramStrs
    return '<a class="fa '+faStr+'" href="'+url_path+'"></a>'

@app.template_global('search_url')
def search_url(param):
    '''
    搜索
    :param param:
    :return:
    '''
    param = str(param)
    from flask import request
    url_path = request.path
    get = request.args.to_dict()
    if '_pjax' in get:
        get.pop('_pjax')
    if param in get:
        get.pop(param)
    if 'page' in get:
        get.pop('page')
    if get:
        paramStr = []
        for v in get:
            paramStr.append(v + '=' + get[v])
        paramStrs = "&".join(paramStr)
        url_path = url_path + '?' + paramStrs
    return url_path
def wirte_log():
    y = str(datetime.datetime.now().year)
    m = str(datetime.datetime.now().month)
    d = str(datetime.datetime.now().day)
    log_path = os.path.join(os.path.dirname(__file__),'log',y,m,d + '.log')
    log_dir = os.path.dirname(log_path)
    if os.path.exists(log_dir) == False:
        os.makedirs(log_dir)
    handler = logging.FileHandler(log_path, encoding='UTF-8')
    handler.setLevel(logging.DEBUG)
    logging_format = logging.Formatter(
        '%(asctime)s - %(levelname)s - %(filename)s - %(funcName)s - %(lineno)s - %(message)s')
    handler.setFormatter(logging_format)
    app.logger.addHandler(handler)
wirte_log()
if __name__ == '__main__':
    app.run()