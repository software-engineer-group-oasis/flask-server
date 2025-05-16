from werkzeug.security import check_password_hash, generate_password_hash

from app.extensions import db
from app.models.models import Renter, SellerContact

class UserService:
    @staticmethod
    def find_all_renters():
        return Renter.query.all()

    @staticmethod
    def find_renter_by_id(renter_id):
        return Renter.query.get_or_404(renter_id)

    @staticmethod
    def create_renter(name, phone, email, password):
        existing_renter = Renter.query.filter_by(email=email).first()
        if existing_renter:
            raise ValueError(f"Email '{email}' already registered.")
        hashed_password = generate_password_hash(password, method='pbkdf2:sha256', salt_length=8)
        new_renter = Renter(name=name, phone=phone, email=email, password_hash=hashed_password)
        db.session.add(new_renter)
        db.session.commit()
        return new_renter

    @staticmethod
    def authenticate_renter(email, password):
        if not email or not password:
            raise ValueError('邮箱和密码不能为空')
        renter = Renter.query.filter_by(email=email).first()
        if not renter:
            raise ValueError('用户不存在')
        if not check_password_hash(renter.password_hash, password):
            raise ValueError('密码错误')
        return renter

    @staticmethod
    def find_all_sellers():
        return SellerContact.query.all()

    @staticmethod
    def find_seller_by_id(contact_id):
        return SellerContact.query.get_or_404(contact_id)

    @staticmethod
    def create_seller(name, email, phone, image, password):
        existing_seller = SellerContact.query.filter_by(email=email).first()
        if existing_seller:
            raise ValueError(f"Email '{email}' already registered.")
        hashed_password = generate_password_hash(password, method='pbkdf2:sha256', salt_length=8)
        new_seller = SellerContact(name=name, email=email, phone=phone, image=image, password_hash=hashed_password)
        db.session.add(new_seller)
        db.session.commit()
        return new_seller

    @staticmethod
    def authenticate_seller(email, password):
        if not email or not password:
            raise ValueError('邮箱和密码不能为空')
        seller = SellerContact.query.filter_by(email=email).first()
        if not seller:
            raise ValueError('用户不存在')
        if not check_password_hash(seller.password_hash, password):
            raise ValueError('密码错误')
        return seller