import os,redis
DEBUG       = False
SECRET_KEY  = os.urandom(24)
DIALECT     = 'mysql'
DRIVER      = 'pymysql'
USERNAME    = 'root'
PASSWORD    = 'you15211266576'
HOST        = '127.0.0.1'
PORT        = '3306'
DARABSE     = 'yxx_admin'
SQLALCHEMY_DATABASE_URI = '{}+{}://{}:{}@{}:{}/{}?charset=utf8'.format(DIALECT,DRIVER,USERNAME,PASSWORD,HOST,PORT,DARABSE)
SQLALCHEMY_TRACK_MODIFICATIONS = False

ADMIN_SESSION_ID            = 'a6273a8b622104d4d63d0'
SESSION_TYPE                = 'redis'  # session类型为redis
SESSION_USE_SIGNER          = True # 如果设置为True，则关闭浏览器session就失效。
SESSION_PERMANENT           = True # 如果设置为True，则关闭浏览器session就失效。
SESSION_KEY_PREFIX          = 'session_yxx:'  # 保存到session中的值的前缀
PERMANENT_SESSION_LIFETIME  = 1200  # 如果没有设置延迟时间，默认的延时时间会被使用。单位为秒。
SESSION_REDIS               = redis.Redis(host='127.0.0.1', port='6379', password='',db=1)  # 用于连接redis的配置


#缓存设置
CACHE_TYPE                  = 'redis'
CACHE_REDIS_DB              = 2
CACHE_REDIS_PASSWORD        = ""
CACHE_REDIS_PORT            = 6379
CACHE_REDIS_HOST            = '127.0.0.1'
CACHE_DEFAULT_TIMEOUT       = 7200

APP_ROOT_PATH = os.path.abspath(os.path.join(os.path.abspath(__file__),".."))
