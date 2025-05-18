from app.utils.district import (
    get_provinces_from_baidu, 
    get_cities_from_baidu, 
    get_districts_from_baidu, 
    get_streets_from_baidu,
    get_address_detail
)

from flask import Blueprint, jsonify, request

blueprint = Blueprint('district', __name__)

@blueprint.route('/provinces', methods=['GET'])
def get_provinces():
    """获取所有省份列表"""
    provinces = get_provinces_from_baidu()
    return jsonify(provinces)

@blueprint.route('/cities', methods=['GET'])
def get_cities():
    """获取指定省份的城市列表"""
    province = request.args.get('province')
    if not province:
        return jsonify({'error': '请提供省份名称'}), 400
    cities = get_cities_from_baidu(province)
    return jsonify(cities)

@blueprint.route('/districts', methods=['GET'])
def get_districts():
    """获取指定城市的区县列表"""
    city = request.args.get('city')
    if not city:
        return jsonify({'error': '请提供城市名称'}), 400
    districts = get_districts_from_baidu(city)
    return jsonify(districts)

@blueprint.route('/streets', methods=['GET'])
def get_streets():
    """获取指定区县的街道列表"""
    district = request.args.get('district')
    if not district:
        return jsonify({'error': '请提供区县名称'}), 400
    streets = get_streets_from_baidu(district)
    return jsonify(streets)

@blueprint.route('/detail', methods=['GET'])
def get_address_details():
    """获取地址详细信息"""
    address = request.args.get('address')
    if not address:
        return jsonify({'error': '请提供地址'}), 400
    detail = get_address_detail(address)
    return jsonify(detail)
