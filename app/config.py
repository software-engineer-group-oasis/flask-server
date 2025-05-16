import os
from dotenv import load_dotenv
from datetime import timedelta

# 加载环境变量（从.env文件加载）
# 之后可以通过 os.getenv() 获取。
load_dotenv()

class Config:
    SQLALCHEMY_DATABASE_URI=os.getenv("DATABASE_URL")
    SECRET_KEY = 'ZfmQKs6MZKZmovBAI9Ng8NPVBdF0cofc50ZDiTSWcBM='  # 生产环境必须修改
    JWT_ALGORITHM = 'HS256'
    JWT_EXPIRATION = timedelta(hours=24)
    DEEPSEEK_API_KEY = os.getenv("DEEPSEEK_API_KEY")

# 继承基类Config
class DevelopmentConfig(Config):
    DEBUG=True