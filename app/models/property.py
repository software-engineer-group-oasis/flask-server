# from app.extensions import db
# from app.models.property_datail import PropertyDetail
# from app.models.user import User

# class Property(db.Model):
#     id = db.Column(db.Integer, primary_key=True)
#     title = db.Column(db.String(200), nullable=False)
#     address = db.Column(db.String(500), nullable=False)
#     price = db.Column(db.Float, nullable=False)
#     created_at = db.Column(db.DateTime, default=db.func.now())
    
#     # 外键：关联用户（房东）
#     owner_id = db.Column(db.Integer, db.ForeignKey('user.id'), nullable=False)

#     # 1对1关系：房源详情
#     detail = db.relationship('PropertyDetail', backref='property', uselist=False)

#     def to_dict(self):
#         return {
#             "id": self.id,
#             "title": self.title,
#             "address": self.address,
#             "price": self.price,
#             "owner_id": self.owner_id,
#             "detail": self.detail.to_dict() if self.detail else None
#         }