# from app.models.property import Property
from app.models.models import Property, PropertyImage, property_amenities, Amenity, Location, SellerContact
from app.extensions import db
from sqlalchemy import func

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