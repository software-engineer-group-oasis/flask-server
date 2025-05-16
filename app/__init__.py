from flask import Flask
from flask_cors import CORS
from app.config import Config
from app.extensions import db
from app.routes import register_blueprints
from app.apis.v1.property_api import blueprint as property_bp
from app.apis.v1.user_api import blueprint as user_bp
from app.apis.v1.deepseek_api import blueprint as deepseek_bp

def create_app():
    app = Flask(__name__)
    app.config.from_object("app.config.Config")
    CORS(app, origins='http://localhost:3000', supports_credentials=True)

    db.init_app(app)

    # 创建表
    # 创建的依据是寻找继承了SQLAlchemy.Model的类
    with app.app_context():
        db.create_all()
    print("db connectd: ", db)
    app.register_blueprint(property_bp, url_prefix='/api/v1')
    app.register_blueprint(user_bp, url_prefix='/api/v1')
    app.register_blueprint(deepseek_bp, url_prefix='/api/v1')
    
    # register_blueprints(app)


    return app
    
    