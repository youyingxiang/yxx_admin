from exts import db
role_admin = db.Table(
    'tb_role_admin',
    db.Column('role_id',db.Integer,db.ForeignKey('tb_role.id',ondelete = 'CASCADE'),primary_key=True),
    db.Column('admin_id',db.Integer,db.ForeignKey('tb_admin.id',ondelete = 'CASCADE'),primary_key=True)
)