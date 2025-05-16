from flask import Blueprint, request, jsonify

from app.utils.deepseek import chat_with_deepseek


blueprint = Blueprint('deepseek', __name__)

@blueprint.route('/deepseek', methods=['POST'])
def get_deepseek_response():
    try:
        # 获取请求体中的 JSON 数据
        data = request.get_json()
        if not data or 'message' not in data or 'json_data' not in data:
            return jsonify({'error': 'Missing "message" or "json_data" in JSON data'}), 400
        message = data['message']
        json_data = data['json_data']
        combined_data = f"{message}\n{json_data}"
        response = chat_with_deepseek(combined_data)
        return jsonify({'data': response}), 200
    except Exception as e:
        return jsonify({'error': str(e)}), 500