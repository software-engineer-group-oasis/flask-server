from flask import Blueprint, request
from app.services.user_service import UserService
from app.utils.response import success, error

blueprint = Blueprint('user', __name__)

@blueprint.route('/users', methods=['GET'])
def get_all_users():
    try:
        users = UserService.find_all()
        data = [{'id':user.id, 'username':user.username, 'email':user.email, 'role':user.role} for user in users]
        return success(data=data)
    except Exception:
        print('error happens in /users', Exception)
        return error()

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
    
@blueprint.route('/users', methods=['POST'])
def register():
    data = request.get_json()
    username = data.get('username')
    email = data.get('email')
    password = data.get('password')

    if not username or not email or not password:
        return error(message="注册信息不完整")
    
    