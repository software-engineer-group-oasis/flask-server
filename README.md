## app 目录结构
![alt text](/project-images/tree.png)

## 查看api
```
flask routes

Endpoint                  Methods  Rule                   
------------------------  -------  -----------------------
property.create_property  POST     /api/v1/properties     
property.list_properties  GET      /api/v1/properties     
static                    GET      /static/<path:filename>
user.get_all_users        GET      /api/v1/users
user.get_user_by_id       GET      /api/v1/users/<user_id>
user.register             POST     /api/v1/users
```