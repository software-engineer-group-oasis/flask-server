from app.utils.district import get_provinces_from_baidu, get_cities_from_baidu

from flask import Blueprint, jsonify, request

blueprint = Blueprint('district', __name__)

@blueprint.route('/provinces', methods=['GET'])
def get_provinces():
    data = get_provinces_from_baidu()
    return jsonify({
        "data": data
    }), 200

@blueprint.route('/cities', methods=['GET'])
def get_cities():
    province = request.args.get('province')
    data = get_cities_from_baidu(province)
    return jsonify({
        "data": data
    }), 200