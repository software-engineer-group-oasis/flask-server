from flask import Blueprint, request
from app.services.property_service import PropertyService
from app.utils.response import success

blueprint = Blueprint('property', __name__)

@blueprint.route('/properties', methods=['GET'])
def list_properties():
    properties = PropertyService.get_all() # 返回一个List
    # 对List中的每一个对象单独进行json序列化
    data = [{'id': p.id, 'title': p.title} for p in properties]
    return success(data)

@blueprint.route('/properties', methods=['POST'])
def create_property():
    data = request.json
    prop = PropertyService.create(data)
    data = {'id':prop.id, 
            'title':prop.title, 
            'address':prop.address, 
            'price': prop.price}
    # 201 created
    return success(data, code=201)