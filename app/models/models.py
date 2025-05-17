from app.extensions import db
from datetime import datetime

# 多对多关联表
property_amenities = db.Table('property_amenities',
                              db.Column('property_id', db.String(36), db.ForeignKey('properties.property_id'),
                                        primary_key=True),
                              db.Column('amenity_id', db.Integer, db.ForeignKey('amenities.amenity_id'),
                                        primary_key=True)
                              )


class Location(db.Model):
    __tablename__ = 'locations'
    location_id = db.Column(db.Integer, primary_key=True)
    address = db.Column(db.String(255), nullable=False)
    city = db.Column(db.String(100), nullable=False)
    province = db.Column(db.String(100), nullable=False)


class SellerContact(db.Model):
    __tablename__ = 'seller_contacts'
    contact_id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(100), nullable=False)
    email = db.Column(db.String(255))
    phone = db.Column(db.String(50))
    image = db.Column(db.String(255))
    password_hash = db.Column(db.String(255))

    def to_dict(self):
        return {
            'contact_id': self.contact_id,
            'name': self.name,
            'email': self.email,
            'phone': self.phone,
            'image': self.image,
        }


class Amenity(db.Model):
    __tablename__ = 'amenities'
    amenity_id = db.Column(db.Integer, primary_key=True)
    amenity_name = db.Column(db.String(50), unique=True, nullable=False)


class PropertyImage(db.Model):
    __tablename__ = 'property_images'
    image_id = db.Column(db.Integer, primary_key=True)
    property_id = db.Column(db.String(36), db.ForeignKey('properties.property_id'), nullable=False)
    image_url = db.Column(db.Text, nullable=False)
    sort_order = db.Column(db.Integer, default=0)


class Property(db.Model):
    __tablename__ = 'properties'
    property_id = db.Column(db.String(36), primary_key=True)
    owner_id = db.Column(db.String(36), nullable=False)
    name = db.Column(db.String(255), nullable=False)
    description = db.Column(db.Text)
    type = db.Column(db.String(50))
    floor = db.Column(db.String(50))
    direction = db.Column(db.String(50))
    decorate = db.Column(db.String(50))
    house_type = db.Column(db.String(50))
    beds = db.Column(db.Integer)
    baths = db.Column(db.Integer)
    area = db.Column(db.Numeric(10, 2))
    monthly_rate = db.Column(db.Numeric(10, 2))
    is_featured = db.Column(db.Boolean, default=False)
    location_id = db.Column(db.Integer, db.ForeignKey('locations.location_id'))
    seller_contact_id = db.Column(db.Integer, db.ForeignKey('seller_contacts.contact_id'))
    created_at = db.Column(db.DateTime, default=datetime.utcnow)
    updated_at = db.Column(db.DateTime, default=datetime.utcnow, onupdate=datetime.utcnow)

    # 关系定义
    location = db.relationship('Location', uselist=False)
    seller_contact = db.relationship('SellerContact', uselist=False)
    amenities = db.relationship('Amenity', secondary=property_amenities, lazy='dynamic')
    images = db.relationship('PropertyImage', backref='property', lazy='dynamic')

    @classmethod
    def filter_by_location(cls, province=None, city=None):
        query = cls.query.join(Location)
        if province:
            query = query.filter(Location.province == province)
        if city:
            query = query.filter(Location.city == city)
        return query.order_by(cls.created_at.desc())

class Renter(db.Model):
    __tablename__ = 'renters'
    renter_id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    name = db.Column(db.String(100), nullable=False)
    phone = db.Column(db.String(20))
    email = db.Column(db.String(100), nullable=False, unique=True)  # 添加唯一约束
    password_hash = db.Column(db.String(100), nullable=False)
    image = db.Column(db.String(255))
    
    def to_dict(self):
        return {
            'renter_id': self.renter_id,
            'name': self.name,
            'phone': self.phone,
            'email': self.email,
            'image': self.image
        }