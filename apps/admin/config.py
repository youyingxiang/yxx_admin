# 配置文件 
'''
    设置菜单
    :param id:
        菜单id 和角色关联.
    :param pri_name:
        权限名称
    :param url_prefix:
        蓝图 或者 也可以成为模块名称
    :param actin_name:
        函数名称
'''
def set_menu(id,icon,pri_name,url_prefix,action_name,child_menu=[],is_treeview=True):
    menu = {'id':id,"icon":icon,'pri_name':pri_name,'url_prefix':url_prefix,'action_name':action_name,'is_treeview':is_treeview}
    if child_menu:
        menu['child']=child_menu
    return menu

menu = (
    set_menu(1,'fa fa-fw fa-paste (alias)','首页管理',None,None,child_menu=(
        set_menu(11,'fa fa-fw fa-copy (alias)','后台首页','adminindex','index',is_treeview=False),
    )),
    set_menu(2,'fa fa-fw fa-user-plus','权限管理',None,None,child_menu=(
        set_menu(21,'fa fa-fw fa-user','管理员列表','adminadmin','index',child_menu=(
            set_menu(211,'','增加管理员','adminadmin','add'),
            set_menu(212,'','修改管理员','adminadmin','edit'),
            set_menu(213,'','删除管理员','adminadmin','delete'),
        ),is_treeview=False),
        set_menu(22, 'fa fa-fw fa-user-secret','角色列表', 'adminrole', 'index', child_menu=(
            set_menu(221,'', '增加角色', 'adminrole', 'add'),
            set_menu(222,'', '修改角色', 'adminrole', 'edit'),
            set_menu(223,'', '删除角色', 'adminrole', 'delete'),
        ),is_treeview=False),

    )),
    set_menu(3,'fa fa-fw fa-wrench','系统管理',None,None,child_menu=(
        set_menu(31,'fa fa-fw fa-legal (alias)','系统配置字段', 'adminconfig_field', 'index', child_menu=(
            set_menu(311,'', '增加配置字段', 'adminconfig_field', 'add'),
            set_menu(312,'','修改配置字段', 'adminconfig_field', 'edit'),
            set_menu(313,'','删除配置字段', 'adminconfig_field', 'delete'),
        ),is_treeview=False),
        set_menu(32,'fa fa-fw fa-sticky-note-o','网站设置', 'adminconfig_field', 'web',is_treeview=False),
        set_menu(33,'fa fa-fw fa-cloud-upload','上传设置', 'adminconfig_field', 'up', is_treeview=False),
        set_menu(34,'fa fa-fw fa-folder-o' ,'日志列表', 'adminlog', 'index', child_menu=(
            set_menu(341,'','删除日志', 'adminlog', 'delete'),
        ),is_treeview=False),
    ))
)

role_type = {1:'超级管理员',2:'普通管理员'}


ADMIN_SESSION_ID = 'a6273a8b622104d4d63d0'

# 分页大小
PAGE_SIZE = 15

