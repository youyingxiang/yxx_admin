from flask import Flask
from apps.admin.controller.upload import bp as adminuploadbp
from apps.admin.controller.index import bp as adminindexbp
from apps.common.controller.tool import bp as commontoolbp
import config
from exts import db
from flask_session import Session
from apps.home.controller.index import bp as homeindexbp
from apps.admin.controller.login import bp as adminloginbp
from apps.admin.controller.role import bp as adminrolebp
from apps.admin.controller.admin import bp as adminadminbp


# # # # # # from think.library.build import Build
# # # # # # Build().run()
app = Flask(__name__)
app.register_blueprint(adminuploadbp)
app.register_blueprint(adminindexbp)
app.register_blueprint(commontoolbp)
app.config.from_object(config)
app.register_blueprint(homeindexbp)
app.register_blueprint(adminloginbp)
app.register_blueprint(adminrolebp)
app.register_blueprint(adminadminbp)
Session(app)

db.init_app(app)
if __name__ == '__main__':
    app.run()