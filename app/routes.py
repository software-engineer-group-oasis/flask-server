from app.apis.v1.property_api import blueprint as property_bp
from app.apis.v1.user_api import blueprint as user_bp

def register_blueprints(app):
    app.register_blueprint(property_bp)
    app.register_blueprint(user_bp)