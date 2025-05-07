from app.extensions import db
from app.models.user import User
from werkzeug.security import generate_password_hash
class UserService:
    
    @staticmethod
    def find_all():
        return User.query.all()
    
    @staticmethod
    def find_by_id(id):
        return User.query.filter_by(id=id).one_or_404()
    
    @staticmethod
    def creat_user(username, email, password, role):
        # 检查用户名或者邮箱是否存在
        existing_user = User.query.filter_by(email=email).first()

        if existing_user:
            raise ValueError(f"Email '{email}' already registered.")
        # 生成密码哈希
        hashed_password = generate_password_hash(password)
        # 创建新用户

        new_user = User(
            username=username,
            email=email,
            password=hashed_password,
            role=role
        )

        # 保存到数据库

        db.session.add(new_user)
        db.session.commit()
        
        return new_user