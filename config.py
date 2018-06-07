import os,redis
DEBUG       = False
SECRET_KEY  = os.urandom(24)
DIALECT     = 'mysql'
DRIVER      = 'pymysql'
USERNAME    = 'root'
PASSWORD    = ''
HOST        = '127.0.0.1'
PORT        = '3306'
DARABSE     = 'py_admin'
SQLALCHEMY_DATABASE_URI = '{}+{}://{}:{}@{}:{}/{}?charset=utf8'.format(DIALECT,DRIVER,USERNAME,PASSWORD,HOST,PORT,DARABSE)
SQLALCHEMY_TRACK_MODIFICATIONS = False

ADMIN_SESSION_ID            = 'a6273a8b622104d4d63d0'
SESSION_TYPE                = 'redis'  # session类型为redis
SESSION_USE_SIGNER          = True # 如果设置为True，则关闭浏览器session就失效。
SESSION_PERMANENT           = True # 如果设置为True，则关闭浏览器session就失效。
SESSION_KEY_PREFIX          = 'session_yxx:'  # 保存到session中的值的前缀
PERMANENT_SESSION_LIFETIME  = 1200  # 如果没有设置延迟时间，默认的延时时间会被使用。单位为秒。
SESSION_REDIS               = redis.Redis(host='127.0.0.1', port='6379', password='',db=1)  # 用于连接redis的配置

APP_ROOT_PATH = os.path.abspath(os.path.join(os.path.abspath(__file__),".."))