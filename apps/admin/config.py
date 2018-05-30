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
def set_menu(id,pri_name,url_prefix,action_name,child_menu=[]):
    menu = {'id':id,'pri_name':pri_name,'url_prefix':url_prefix,'action_name':action_name}
    if child_menu:
        menu['child']=child_menu
    return menu

menu = (
    set_menu(1,'首页',None,None,child_menu=(
        set_menu(11,'后台首页','admin/index','index'),
    )),
    set_menu(2,'权限管理',None,None,child_menu=(
        set_menu(21,'用户列表','admin/admin','index',child_menu=(
            set_menu(211,'增加用户','admin/admin','add'),
            set_menu(212,'修改用户','admin/admin','edit'),
            set_menu(213,'删除用户','admin/admin','delete'),
        )),
        set_menu(22, '角色列表', 'admin/role', 'index', child_menu=(
            set_menu(221, '增加角色', 'admin/role', 'add'),
            set_menu(222, '修改角色', 'admin/role', 'edit'),
            set_menu(223, '删除角色', 'admin/role', 'delete'),
        )),
    ))
)

role_type = {1:'超级管理员',2:'普通管理员'}





