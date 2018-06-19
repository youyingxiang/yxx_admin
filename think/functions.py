import os

def is_writeable(path, check_parent=False):
    '''
        检测文件是否可写
        @path         文件路径
        @check_parent 是否检测父路径
    '''
    if os.access(path, os.F_OK) and os.access(path, os.W_OK):
        return True
    if os.access(path, os.F_OK) and not os.access(path, os.W_OK):
        return False
    if check_parent is False:
        return False
    parent_dir = os.path.dirname(path)
    if not os.access(parent_dir, os.F_OK):
        return False
    return os.access(parent_dir, os.W_OK)

def is_readable(path):
    '''
        检测文件是否可读
        @path         文件路径
    '''
    if os.access(path, os.F_OK) and os.access(path, os.R_OK):
        return True
    return False

def file_get_contents(path,type='r'):
    '''
        获取文件
        @path         文件路径
        @type         r read()读取
                      rl readlines()读取
    '''
    str = ''
    with open(path, 'r',encoding='utf-8') as f:
        if type == 'r':
            str = f.read()
        elif type == 'rl':
            for line in f.readlines():
                str += line.strip()
        return str;

def file_put_contents(path,content,type='w'):
    '''
        写入文件
        @path         文件路径
        @type         w 写文件不追加
                      a  追加
    '''
    with open(path, type,encoding='utf-8')as f:
        f.write(content)

def touch(path):
    if os.path.exists(path):
        return False
    else:
        file_put_contents(path,'')
        if os.path.exists(path):
            return True
        else:
            return False



