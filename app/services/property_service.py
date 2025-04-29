from app.models.property import Property
from app.extensions import db

class PropertyService:
    
    @staticmethod
    def get_all():
        return Property.query.all()
    
    @staticmethod
    def create(data):
        new_prop = Property(**data)
        db.session.add(new_prop)
        db.session.commit()
        return new_prop