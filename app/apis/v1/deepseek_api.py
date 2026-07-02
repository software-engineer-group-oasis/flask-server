import json

from flask import Blueprint, request, jsonify, Response

from app.utils.deepseek import chat_with_deepseek, stream_chat_with_deepseek


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


@blueprint.route('/deepseek/stream', methods=['POST'])
def stream_deepseek_response():
    """SSE 流式路由：逐 token 推送 DeepSeek 响应"""
    data = request.get_json()
    if not data or 'message' not in data or 'json_data' not in data:
        err = 'Missing "message" or "json_data" in JSON data'
        def error_gen():
            yield f"data: {json.dumps({'error': err})}\n\n"
        return Response(error_gen(), mimetype='text/event-stream', status=400)

    message = data['message']
    json_data = data['json_data']
    combined = f"{message}\n{json_data}"

    def generate():
        try:
            for token in stream_chat_with_deepseek(combined):
                payload = json.dumps({"content": token}, ensure_ascii=False)
                yield f"data: {payload}\n\n"
            yield "data: [DONE]\n\n"
        except Exception as e:
            yield f"data: {json.dumps({'error': str(e)})}\n\n"

    headers = {
        "Cache-Control": "no-cache",
        "X-Accel-Buffering": "no",
        "Connection": "keep-alive",
    }
    return Response(generate(), mimetype='text/event-stream', headers=headers)