import jwt
from datetime import datetime, timedelta
from flask import request, jsonify
from functools import wraps
from app.config import Config
from app.models.user import User


def generate_token(user_id, role):
    """生成JWT令牌"""
    payload = {
        'sub': str(user_id),
        'role': role,
        'exp': datetime.utcnow() + Config.JWT_EXPIRATION
    }
    return jwt.encode(payload, Config.SECRET_KEY, algorithm=Config.JWT_ALGORITHM)


def decode_token(token):
    """解码验证JWT令牌"""
    try:
        payload = jwt.decode(token, Config.SECRET_KEY, algorithms=[Config.JWT_ALGORITHM])
        return payload
    except jwt.ExpiredSignatureError:
        raise ValueError('令牌已过期')
    except jwt.DecodeError:
        raise ValueError('解码失败')
    except jwt.InvalidSignatureError:
        raise ValueError('签名错误')
    except jwt.InvalidTokenError as e:
        raise ValueError(f'无效令牌: {str(e)}')


def jwt_required(roles=None):
    """JWT验证装饰器"""

    def decorator(f):
        @wraps(f)
        def wrapped(*args, **kwargs):
            # token = request.headers.get('Authorization')
            token = request.cookies.get('token')
            if not token or not token.startswith('Bearer '):
                return jsonify({'message': '缺失认证令牌'}), 401

            try:
                token = token.split(' ')[1]
                payload = decode_token(token)
                user = User.query.get(payload['sub'])

                if not user:
                    raise ValueError('用户不存在')

                if roles and payload['role'] not in roles:
                    raise ValueError('权限不足')

                request.current_user = user
                return f(*args, **kwargs)

            except ValueError as e:
                return jsonify({'message': str(e)}), 401

        return wrapped

    return decorator