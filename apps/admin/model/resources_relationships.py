from exts import db
resources_relationships = db.Table(
    'tb_resources_relationships',
    db.Column('resources_id',db.Integer,db.ForeignKey('tb_resources.id',ondelete = 'CASCADE'),primary_key=True),
    db.Column('object_id',db.Integer,db.ForeignKey('tb_postmeta.id',ondelete = 'CASCADE'),primary_key=True)
)