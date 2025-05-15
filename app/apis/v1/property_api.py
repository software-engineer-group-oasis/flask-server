from flask import Blueprint, request
from app.services.property_service import PropertyService
from app.utils.response import success

blueprint = Blueprint('property', __name__)

@blueprint.route('/properties/<property_id>', methods=['GET'])
def get_property_by_id(property_id):
    property = PropertyService.get_by_property_id(property_id)
    amenities = PropertyService.get_amenities_by_property_id(property_id)
    images = PropertyService.get_images_by_property_id(property_id)
    location = PropertyService.get_location_by_id(property.location_id)
    seller_contact = PropertyService.get_seller_contact_by_id(property.seller_contact_id)
    data = {
        'id': property.property_id,
        'name': property.name,
        'description': property.description,
        'type': property.type,
        'floor': property.floor,
        'direction': property.direction,
        'decorate': property.decorate,
        'house_type': property.house_type,
        'beds': property.beds,
        'baths': property.baths,
        'area': str(property.area),
        'monthly_rate': str(property.monthly_rate),
        'is_featured': property.is_featured,
        'location_id': property.location_id,
        'seller_contact_id': property.seller_contact_id,
        'seller_contact': {
            'name': seller_contact.name,
            'email': seller_contact.email,
            'phone': seller_contact.phone,
            'image': seller_contact.image if seller_contact.image else "http://localhost:3000/images/default.png"
        },
        'created_at': property.created_at.isoformat(),
        'updated_at': property.updated_at.isoformat(),
        "amenities":amenities.split(',') if amenities else "",
        "images":images if images else "",
        "location": {
            "address": location.address,
            "city": location.city,
            "province": location.province,
        }
    }
    return success(data=data)

# @blueprint.route('/properties', methods=['POST'])
# def create_property():
#     data = request.json
#     prop = PropertyService.create(data)
#     data = {'id':prop.id, 
#             'title':prop.title, 
#             'address':prop.address, 
#             'price': prop.price}
#     # 201 created
#     return success(data, code=201)