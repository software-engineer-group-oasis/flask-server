from flask import Blueprint, request, jsonify
from app.services.user_service import UserService
from app.utils.response import success, error
from app.utils.jwt_util import generate_token
from flask import make_response
from app.utils.jwt_util import decode_token

blueprint = Blueprint('user', __name__)

# 获取所有用户
@blueprint.route('/users', methods=['GET'])
def get_all_users():
    try:
        users = UserService.find_all()
        data = [{'id':user.id, 'username':user.username, 'email':user.email, 'role':user.role} for user in users]
        return success(data=data)
    except Exception:
        print('error happens in /users', Exception)
        return error()

# 根据 ID 获取用户
@blueprint.route('/users/<user_id>', methods=['GET'])
def get_user_by_id(user_id):
    try:
        user = UserService.find_by_id(user_id)
        if user:
            data = {'id': user.id, 'username': user.username, 'email': user.email, 'role':user.role}
            return success(data=data)
        else:
            return error(message='User not found', code=404)
    except Exception as e:
        print(f'Error fetching user: {e}')
        return error(message=str(e))

# 注册   
@blueprint.route('/users', methods=['POST'])
def register():
    data = request.get_json()
    print('register with data:', data)
    username = data.get('username')
    email = data.get('email')
    password = data.get('password')
    role = data.get('role')

    if not username or not email or not password:
        return error(message="注册信息不完整")

    try:
        user = UserService.create_user(username, email, password, role)
        data = {'id': user.id, 'username': user.username, 'email': user.email, 'role': user.role}
        return success(data=data)
    except Exception as e:
        print(f'Error register: {e}')
        return error(message='用户已经注册')

# 登录
@blueprint.route('/jwt', methods=['POST'])
def login():
    data = request.get_json()
    print('login with data:', data)
    email = data.get('email')
    password = data.get('password')

    if not email or not password:
        return error(message="邮箱和密码不能为空", code=400)

    try:
        user = UserService.authenticate(email, password)
        token = generate_token(user.id, user.role)

        # 构造返回数据
        response_data = success(data={
            'user': {
                'id': user.id,
                'username': user.username,
                'email': user.email,
                'role': user.role
            }
        })

        # 创建响应对象
        res = make_response(response_data)

        # 设置 Cookie，这里设置了 HttpOnly 和 Secure 标志，可以根据需要调整
        res.set_cookie(
            key='token',
            value=token,
            httponly=True,  # 防止 XSS 攻击
            secure=False,  # 开发环境设为 False，生产建议 True（配合 HTTPS）
            samesite='Lax',  # 或 'Strict' / 'None'
            path='/'  # Cookie 作用路径
        )
        return res

    except ValueError as e:
        return error(message=str(e), code=401)
    except Exception as e:
        print(f'[登录错误] {str(e)}')
        return error(message="登录失败", code=500)


# 检查登录状态
@blueprint.route('/users/check', methods=['GET'])
def check():
    token = request.cookies.get('token')
    print('client sends token:', token)
    try:
        data = decode_token(token)
        print(data)
        user = UserService.find_by_id(data['sub'])
        if not user:
            return error(message='用户不存在', code=404)
        data = {
            'id': user.id,
            'username': user.username,
            'email': user.email,
            'role': user.role
        }
        return success(data=data)
    except Exception as e:
        print('error happens in check', str(e))
        return error(message='未登录', code=200)

# 登出
@blueprint.route('/logout', methods=['POST'])
def logout():
    res = make_response(success())
    res.set_cookie('token', '', expires=0)  # 清空 Cookie
    return res