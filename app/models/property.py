from app.extensions import db

class Property(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String(200), nullable=False)
    address = db.Column(db.String(500))
    price = db.Column(db.Float)