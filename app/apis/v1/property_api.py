from xml.sax.handler import all_properties

from flask import Blueprint, request
from app.services.property_service import PropertyService
from app.utils.response import success, error

blueprint = Blueprint('property', __name__)

def get_property_detail(property):
    property_id = property.property_id
    amenities = PropertyService.get_amenities_by_property_id(property_id)
    images = PropertyService.get_images_by_property_id(property_id)
    location = PropertyService.get_location_by_id(property.location_id)
    seller_contact = PropertyService.get_seller_contact_by_id(property.seller_contact_id)
    return {
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
        "amenities": amenities.split(',') if amenities else "",
        "images": images if images else "",
        "location": {
            "address": location.address,
            "city": location.city,
            "province": location.province,
        }
    }

@blueprint.route('/properties/<property_id>', methods=['GET'])
def get_property_by_id(property_id):
    property = PropertyService.get_by_property_id(property_id)
    data = get_property_detail(property)
    return success(data=data)

@blueprint.route('/properties', methods=['GET'])
def get_properties():
    properties = PropertyService.get_all()
    all_properties_data = [get_property_detail(prop) for prop in properties]
    return success(data=all_properties_data)

@blueprint.route('/properties/search', methods=['GET'])
def search_properties():
    province = request.args.get('province')
    city = request.args.get('city')
    print(f'searching: {province} {city}')
    properties = PropertyService.filter_properties_by_location(province, city)
    print('search result: ', properties)
    all_properties_data = [get_property_detail(prop) for prop in properties]
    return success(data=all_properties_data)

@blueprint.route('/properties', methods=['POST'])
def create_property():
    data = request.json
    try:
        prop = PropertyService.create_property_with_related_data(data)
        data = get_property_detail(prop)
        return success(data, code=201)
    except Exception as e:
        return error(message=str(e), code=500)

@blueprint.route('/upload', methods=['POST'])
def upload_image():
    files = request.files.getlist('images')
    urls = []
    if not files:
        return error(message='请上传图片', code=400)
    for file in files:
        url = PropertyService.upload_image(file)
        urls.append(url)
    return success(data=urls)