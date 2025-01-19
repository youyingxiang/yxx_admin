demo地址 [PFCMS](http://pfcms.echo500.com/)

简介：

PFCMS是一个免费开源的cms内容管理框架，是为了敏捷WEB应用开发和简化企业应用开发而诞生的。PFCMS从诞生以来一直秉承简洁实用的设计原则，在保持出色的性能和至简的代码的同时，也注重易用性。遵循Apache2开源许可协议发布，意味着你可以免费使用PFCMS，甚至允许把你基于PFCMS开发的应用开源或商业产品发布/销售。



技术结构：
PFCMS采用的是python3.6版本。

web开发框架采用的是flask。

数据表的设计部分借鉴的wordpress开源项目。

orm采用的sqlalchemy关系模型系统。

前端主要采用的bootstrap框架，以及jQuery.pjax页面无刷新。

权限设计是rbac模式，本人从中进行了简化


面向人群：
python web二次开发。

学习python 以及flask框架的学习者


心得：
作者本人长期从事的是PHP开发，php有很多优秀的开源项目。后面接触了python,于是抱着学习的目地。完成了PFCMS的开发。代码中有不合理的地方，可以及时反馈。



~~~
project  应用部署目录
├─apps                     应用目录（可设置）
│  ├─admin                 后台模块文件目录
│  │  └─cotroller          控制器文件目录       
│  │     ├─form            表单验证文件目录
│  │     ├─model           数据库模型文件目录
│  │     ├─__init__.py     python文件(可以方便引入库)
│  │     ├─common.py       存放后台常用到的函数
│  │     ├─config.py       后台参数配置文件
│  │     ├─decorator.py    装饰器
│  │     └─hooks.py        钩子文件     
│  ├─common                前后台共用模块   
│  │   └─..                目录结构同上
│  │ 
│  ├─home                  前台模块文件目录
│  │   └─..                目录结构同上
│  └─__init__.py
├─log                      系统日志文件  
│
├─migrations               数据迁移文件
│
├─static                   静态资源文件
│
├─templates                模版文件
│
├─think                    存放写的一些拓展库
│   ├─library              工具包
│   │   ├─bulid            当前项目的目录结构就是这个包自动构建的，
│   │   │                  可以自动构建蓝图，代码部分自动生成,在我开发使用中尚未发现问题
│   │   ├─captche          这是我参考PHP的验证类，构建的一个图形验证库
│   ├─baksql.py            数据库备份还原的类库
│   ├─functions.py         我把python的一些常用到函数按php函数的名称封装的库
│   └─restful.py           restful风格接口类库
│
├─venv                     编辑器自带的(无需关心)
├─app.py                   整个项目的主文件
├─config.py                配置文件
├─exts.py                  防止循环引用的一个文件
├─manage.py                项目管理文件，可执行脚本命令 数据迁移等
└─requirement.txt          pip拓展库  
~~~

