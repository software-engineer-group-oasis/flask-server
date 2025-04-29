from app.apis.v1.property_api import blueprint as property_bp

def register_blueprints(app):
    app.register_blueprint(property_bp)