from app.extensions import db

class User(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    username = db.Column(db.String(80), nullable=False)
    email = db.Column(db.String(100), unique=True, nullable=False)
    password_hash = db.Column(db.String(120), nullable=False)
    role = db.Column(db.String(10), nullable=False) # landlord 房东； tenant 租客

    # # User模型自动与Property模型建立关系
    # # SQLAlchemy自动通过外键来查找管理的数据
    # # 在User对象上调用user.properties可以拿到该用户的所有资源
    # # backref='owner' 自动为Property模型添加字段property.owner
    # properties = db.relationship('Property', backref='owner', lazy=True)

    def __repr__(self):
        return f'<User {self.username} - Role: {self.role}>'
    def to_dict(self):
        return {
            'id': self.id,
            'username': self.username,
            'email': self.email,
            'password_hash': self.password_hash,
            'role': self.role,
        }