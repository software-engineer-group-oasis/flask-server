import os
from dotenv import load_dotenv

# 加载环境变量（从.env文件加载）
# 之后可以通过 os.getenv() 获取。
load_dotenv()

class Config:
    SQLALCHEMY_DATABASE_URI=os.getenv("DATABASE_URL")

# 继承基类Config
class DevelopmentConfig(Config):
    DEBUG=True