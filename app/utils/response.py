from flask import jsonify
def success(data=None, message="OK", code=200):
    return jsonify({
        "success":True,
        "message":message,
        "data":data    
    }), code

def error(message='Error', code=400):
    return jsonify({
        "success":False,
        "message":message
    }), code