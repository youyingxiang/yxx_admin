from exts import db
term_relationships = db.Table(
    'tb_term_relationships',
    db.Column('term_taxonomy_id',db.Integer,db.ForeignKey('tb_term_taxonomy.id',ondelete = 'CASCADE'),primary_key=True),
    db.Column('posts_id',db.Integer,db.ForeignKey('tb_posts.id',ondelete = 'CASCADE'),primary_key=True)
)