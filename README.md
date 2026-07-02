## Set up

`python 3.11.14`

```bash
# 创建虚拟环境
python -m venv .venv

# 激活虚拟环境
./.venv/Scripts/activate

# 安装依赖
pip install -r ./requirements.txt

# 启动 MySQL 容器
docker compose up -d
```


## 启动

```bash
python run.py
```

## 查看api
```
flask routes

Endpoint                        Methods  Rule                            
------------------------------  -------  --------------------------------
deepseek.get_deepseek_response  POST     /api/v1/deepseek                
district.get_address_details    GET      /api/v1/detail                  
district.get_cities             GET      /api/v1/cities                  
district.get_districts          GET      /api/v1/districts               
district.get_provinces          GET      /api/v1/provinces               
district.get_streets            GET      /api/v1/streets                 
property.create_property        POST     /api/v1/properties              
property.get_properties         GET      /api/v1/properties              
property.get_property_by_id     GET      /api/v1/properties/<property_id>
property.search_properties      GET      /api/v1/properties/search       
property.upload_image           POST     /api/v1/upload                  
static                          GET      /static/<path:filename>         
user.check                      GET      /api/v1/users/check             
user.get_all_renters            GET      /api/v1/renters                 
user.get_all_sellers            GET      /api/v1/sellers                 
user.get_renter_by_id           GET      /api/v1/renters/<renter_id>     
user.get_seller_by_id           GET      /api/v1/sellers/<contact_id>    
user.login_renter               POST     /api/v1/renters/jwt             
user.login_seller               POST     /api/v1/sellers/jwt             
user.logout                     POST     /api/v1/logout                  
user.register_renter            POST     /api/v1/renters                 
user.register_seller            POST     /api/v1/sellers 
```