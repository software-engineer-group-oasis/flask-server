from flask import Blueprint, request, jsonify
from app.services.user_service import UserService
from app.utils.response import success, error
from app.utils.jwt_util import generate_token
from flask import make_response
from app.utils.jwt_util import decode_token

blueprint = Blueprint('user', __name__)

# 获取所有租客
@blueprint.route('/renters', methods=['GET'])
def get_all_renters():
    try:
        renters = UserService.find_all_renters()
        data = [renter.to_dict() for renter in renters]
        return success(data=data)
    except Exception as e:
        print(f'error happens in /renters: {e}')
        return error()

# 根据 ID 获取租客
@blueprint.route('/renters/<renter_id>', methods=['GET'])
def get_renter_by_id(renter_id):
    try:
        renter = UserService.find_renter_by_id(renter_id)
        return success(data=renter.to_dict())
    except Exception as e:
        print(f'Error fetching renter: {e}')
        return error(message=str(e))

# 租客注册
@blueprint.route('/renters', methods=['POST'])
def register_renter():
    data = request.get_json()
    print('register with data:', data)
    name = data.get('name')
    phone = data.get('phone')
    email = data.get('email')
    password = data.get('password')
    print("name:", name,"phone:", phone, "email", email, "password",password)

    if not name or not email or not password:
        return error(message="注册信息不完整")

    try:
        renter = UserService.create_renter(name, phone, email, password)
        return success(data=renter.to_dict())
    except Exception as e:
        print(f'Error register renter: {e}')
        return error(message=str(e))

# 租客登录
@blueprint.route('/renters/jwt', methods=['POST'])
def login_renter():
    data = request.get_json()
    email = data.get('email')
    password = data.get('password')

    if not email or not password:
        return error(message="邮箱和密码不能为空", code=400)

    try:
        renter = UserService.authenticate_renter(email, password)
        token = generate_token(renter.renter_id, 'renter')
        response_data = success(data={
            'user': renter.to_dict()
        })
        res = make_response(response_data)
        res.set_cookie(
            key='token',
            value=token,
            httponly=True,
            secure=False,
            samesite='Lax',
            path='/'
        )
        return res
    except ValueError as e:
        return error(message=str(e), code=401)
    except Exception as e:
        print(f'[登录错误] {str(e)}')
        return error(message="登录失败", code=500)

# 获取所有卖家
@blueprint.route('/sellers', methods=['GET'])
def get_all_sellers():
    try:
        sellers = UserService.find_all_sellers()
        data = [seller.to_dict() for seller in sellers]
        return success(data=data)
    except Exception as e:
        print(f'error happens in /sellers: {e}')
        return error()

# 根据 ID 获取卖家
@blueprint.route('/sellers/<contact_id>', methods=['GET'])
def get_seller_by_id(contact_id):
    try:
        seller = UserService.find_seller_by_id(contact_id)
        return success(data=seller.to_dict())
    except Exception as e:
        print(f'Error fetching seller: {e}')
        return error(message=str(e))

# 卖家注册
@blueprint.route('/sellers', methods=['POST'])
def register_seller():
    data = request.get_json()
    name = data.get('name')
    email = data.get('email')
    phone = data.get('phone')
    image = data.get('image')
    password = data.get('password')

    if not name or not email or not password:
        return error(message="注册信息不完整")

    try:
        seller = UserService.create_seller(name, email, phone, image, password)
        return success(data=seller.to_dict())
    except Exception as e:
        print(f'Error register seller: {e}')
        return error(message=str(e))

# 卖家登录
@blueprint.route('/sellers/jwt', methods=['POST'])
def login_seller():
    data = request.get_json()
    email = data.get('email')
    password = data.get('password')

    if not email or not password:
        return error(message="邮箱和密码不能为空", code=400)

    try:
        seller = UserService.authenticate_seller(email, password)
        token = generate_token(seller.contact_id, 'seller')
        response_data = success(data={
            'user': seller.to_dict()
        })
        res = make_response(response_data)
        res.set_cookie(
            key='token',
            value=token,
            httponly=True,
            secure=False,
            samesite='Lax',
            path='/'
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
    try:
        data = decode_token(token)
        user_type = data['role']
        user_id = data['sub']
        if user_type == 'renter':
            user = UserService.find_renter_by_id(user_id)
        elif user_type == 'seller':
            user = UserService.find_seller_by_id(user_id)
        else:
            return error(message='未知用户类型', code=400)
        return success(data=user.to_dict())
    except Exception as e:
        print('error happens in check', str(e))
        return error(message='未登录', code=200)

# 登出
@blueprint.route('/logout', methods=['POST'])
def logout():
    res = make_response(success())
    res.set_cookie('token', '', expires=0)
    return res