from app.models.user import User
from app.models.property import Property

# 获取ID=1的用户
user = User.query.get(1)

# 获取该用户所有的房源
for prop in user.propeties:
    print(prop.title)

# 反向访问，获取某个房源的房东
prop = Property.get(1)
print(prop.owner.username) 

