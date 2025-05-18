# 用于行政区划获取
import requests
from app.config import Config
from functools import lru_cache

url = "https://api.map.baidu.com/api_region_search/v1/"
geocoding_url = "https://api.map.baidu.com/geocoding/v3/"
ak = Config.BAIDU_MAP_AK

@lru_cache(maxsize=1)
def get_provinces_from_baidu():
    """获取所有省份列表"""
    params = {
        "keyword": "中国",
        "sub_admin": 1,
        "ak": ak
    }
    res = requests.get(url=url, params=params)
    data = res.json()
    
    if data.get('status') == 0 and 'districts' in data and len(data['districts']) > 0:
        # 从百度地图 API 返回的数据中提取省份信息
        provinces = []
        for district in data['districts'][0]['districts']:
            provinces.append({
                "code": district.get('code', ''),
                "name": district.get('name', '')
            })
        return provinces
    else:
        print(f"API 返回状态码: {data.get('status')}, 错误信息: {data.get('message')}")
        return []

@lru_cache(maxsize=32)
def get_cities_from_baidu(province):
    """获取指定省份的城市列表"""
    params = {
        "keyword": province,
        "sub_admin": 1,
        "ak": ak
    }
    res = requests.get(url=url, params=params)
    data = res.json()
    
    if data.get('status') == 0 and 'districts' in data and len(data['districts']) > 0:
        # 从百度地图 API 返回的数据中提取城市信息
        cities = []
        for district in data['districts'][0]['districts']:
            cities.append({
                "code": district.get('code', ''),
                "name": district.get('name', '')
            })
        return cities
    else:
        print(f"API 返回状态码: {data.get('status')}, 错误信息: {data.get('message')}")
        return []

@lru_cache(maxsize=128)
def get_districts_from_baidu(city):
    """获取指定城市的区县列表"""
    try:
        params = {
            "keyword": city,
            "sub_admin": "1",
            "ak": ak
        }
        
        response = requests.get(url=url, params=params)
        data = response.json()
        
        districts = []
        
        if data.get('status') == 0:
            if 'districts' in data:
                top_district = data['districts']
                
                if isinstance(top_district, list) and len(top_district) > 0:
                    top_district = top_district[0]
                
                if 'districts' in top_district and isinstance(top_district['districts'], list):
                    for district in top_district['districts']:
                        if district.get('level') == '3' or '区' in district.get('name', '') or '县' in district.get('name', ''):
                            districts.append({
                                "code": district.get('code', ''),
                                "name": district.get('name', '')
                            })
        
        # 如果是直辖市但没有获取到区县，尝试另一种方法
        if not districts and city in ["北京市", "天津市", "上海市", "重庆市"]:
            city_name = city[:-1]  # 去掉"市"字
            params = {
                "keyword": city_name,
                "sub_admin": "2",
                "ak": ak
            }
            
            response = requests.get(url=url, params=params)
            data = response.json()
            
            if data.get('status') == 0 and 'districts' in data:
                top_districts = data['districts']
                
                if isinstance(top_districts, list):
                    for district1 in top_districts:
                        if 'districts' in district1 and isinstance(district1['districts'], list):
                            for district2 in district1['districts']:
                                if 'districts' in district2 and isinstance(district2['districts'], list):
                                    for district3 in district2['districts']:
                                        if district3.get('level') == '3' or '区' in district3.get('name', '') or '县' in district3.get('name', ''):
                                            districts.append({
                                                "code": district3.get('code', ''),
                                                "name": district3.get('name', '')
                                            })
        
        return districts
    except Exception as e:
        print(f"获取区县列表出错: {e}")
        return []

@lru_cache(maxsize=256)
def get_streets_from_baidu(district):
    """获取指定区县的街道列表"""
    try:
        params = {
            "keyword": district,
            "sub_admin": 1,
            "ak": ak
        }
        response = requests.get(url=url, params=params)
        data = response.json()
        
        if data.get('status') == 0 and 'districts' in data and len(data['districts']) > 0:
            # 从百度地图 API 返回的数据中提取街道信息
            streets = []
            for district in data['districts'][0]['districts']:
                streets.append({
                    "code": district.get('code', ''),
                    "name": district.get('name', '')
                })
            return streets
        else:
            print(f"API 返回状态码: {data.get('status')}, 错误信息: {data.get('message')}")
            return []
    except Exception as e:
        print(f"获取街道列表出错: {e}")
        return []

def get_address_detail(address):
    """获取地址详细信息"""
    try:
        params = {
            "address": address,
            "output": "json",
            "ak": ak
        }
        response = requests.get(url=geocoding_url, params=params)
        data = response.json()
        
        if data.get('status') == 0 and 'result' in data:
            return data['result']
        else:
            print(f"API 返回状态码: {data.get('status')}, 错误信息: {data.get('message')}")
            return None
    except Exception as e:
        print(f"获取地址详情出错: {e}")
        return None
