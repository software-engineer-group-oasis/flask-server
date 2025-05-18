# from app.models.property import Property
from app.models.models import Property, PropertyImage, property_amenities, Amenity, Location, SellerContact
from app.extensions import db
from sqlalchemy import func
from sqlalchemy.exc import SQLAlchemyError

class PropertyService:
    
    @staticmethod
    def get_all():
        return Property.query.all()
    
    @staticmethod
    def create(data):
        new_prop = Property(**data)
        db.session.add(new_prop)
        db.session.commit()
        return new_prop

    @staticmethod
    def get_by_property_id(property_id):
        return Property.query.get_or_404(property_id)
    
    @staticmethod
    def get_amenities_by_property_id(property_id):
        result = db.session.query(
            func.group_concat(Amenity.amenity_name).label('amenities')
        ).join(
            property_amenities, property_amenities.c.amenity_id == Amenity.amenity_id
        ).filter(
            property_amenities.c.property_id == property_id
        ).first()
        return result.amenities if result else ""
    
    @staticmethod
    def get_images_by_property_id(property_id):
        images = PropertyImage.query.filter_by(property_id=property_id).order_by(PropertyImage.sort_order).all()
        return [image.image_url for image in images]

    @staticmethod
    def get_location_by_id(location_id):
        return Location.query.get_or_404(location_id)

    @staticmethod
    def get_seller_contact_by_id(contact_id):
        return SellerContact.query.get_or_404(contact_id)

    @staticmethod
    def filter_properties_by_location(province, city):
        return Property.filter_by_location(province, city)

    @staticmethod
    def create_property_with_related_data(data):
        try:
            # 插入位置信息
            location = Location(
                address=data['location']['address'],
                city=data['location']['city'],
                province=data['location']['province']
            )
            db.session.add(location)
            db.session.flush()
            location_id = location.location_id

            # 插入卖家信息
            seller = SellerContact(
                name=data['seller']['name'],
                email=data['seller']['email'],
                phone=data['seller']['phone']
            )
            db.session.add(seller)
            db.session.flush()
            seller_contact_id = seller.contact_id

            # 插入房源主数据
            prop_data = data['property']
            prop_data['location_id'] = location_id
            prop_data['seller_contact_id'] = seller_contact_id
            new_prop = Property(**prop_data)
            db.session.add(new_prop)
            db.session.flush()
            property_id = new_prop.property_id

            # 插入设施关联
            amenity_names = data['amenities']
            amenities = Amenity.query.filter(Amenity.amenity_name.in_(amenity_names)).all()
            for amenity in amenities:
                db.session.execute(
                    property_amenities.insert().values(
                        property_id=property_id,
                        amenity_id=amenity.amenity_id
                    )
                )

            # 插入图片信息
            for image in data['images']:
                new_image = PropertyImage(
                    property_id=property_id,
                    image_url=image['image_url'],
                    sort_order=image['sort_order']
                )
                db.session.add(new_image)

            # 提交事务
            db.session.commit()
            return new_prop
        except SQLAlchemyError as e:
            # 回滚事务
            db.session.rollback()
            raise e
        except Exception as e:
            db.session.rollback()
            raise e