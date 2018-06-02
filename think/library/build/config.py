build = {
    'apps':[
        {

            # 生成应用公共文件
            'file' : ['__init__.py'],
            # 'dir'  : ['controller', 'model'],
            # 定义demo模块的自动生成 （按照实际定义的文件名生成）
            'admin'     : {
                'file'   : ['decorator.py','hooks.py','__init__.py'],
                'dir'    : [ 'controller', 'model','form'],
                'form'   : ['admin','role','config_field'],
                'controller' : ['admin', 'role','login','index','upload','config_field','log'],
                'model'       : ['admin', 'role','role_user','config_field','log'],
                'templates'   : ['admin/add','admin/edit','admin/index','role/add','role/edit',
                                 'role/index','login/login','common/admin_base','common/base','common/_macro','index/index','common/search',
                                 'config_field/add','config_field/edit','config_field/index','log/index'],
                # 'static'      :  ['css/test.css','js/test.js','css/product.css']
            },
            'common' :{
                'file': ['decorator.py', 'hooks.py', '__init__.py'],
                'dir'    : [ 'controller', 'model','form'],
                'controller': ['tool'],
            },
            # 'home'     : {
            #     'file'   : ['decorator.py','hooks.py','__init__.py'],
            #     'dir'    : [ 'controller', 'model','form'],
            #     'form'   : ['user', 'test'],
            #     'controller' : ['user', 'test'],
            #     'model'       : ['user', 'test'],
            #     'templates'   : ['user/index','test/index'],
            #     'static'      :  ['css/test.css','js/test.js','js/user.js']
            # }
        }
    ]
}