# 用于行政区划获取
import requests
from app.config import Config

url = "https://api.map.baidu.com/api_region_search/v1/"
ak = Config.BAIDU_MAP_AK

def get_provinces_from_baidu():
    params = {
        "keyword": "中国",
        "sub_admin": 1,
        "ak": ak
    }
    res = requests.get(url=url, params=params)
    return res.json()

def get_cities_from_baidu(province):
    params = {
        "keyword": province,
        "sub_admin": 1,
        "ak": ak
    }
    res = requests.get(url=url, params=params)
    return res.json()