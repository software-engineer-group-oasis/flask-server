# # app/models/property_detail.py
# from app.extensions import db

# class PropertyDetail(db.Model):
#     id = db.Column(db.Integer, primary_key=True)
#     property_id = db.Column(db.Integer, db.ForeignKey('property.id'), unique=True, nullable=False)

#     beds = db.Column(db.Integer, default=1)                 # 床位数量
#     wifi = db.Column(db.Boolean, default=False)             # 是否有Wi-Fi
#     kitchen = db.Column(db.Boolean, default=False)          # 是否有厨房
#     bathroom = db.Column(db.Boolean, default=False)         # 是否有独立卫生间
#     balcony = db.Column(db.Boolean, default=False)          # 是否有阳台
#     air_conditioning = db.Column(db.Boolean, default=False) # 空调
#     heating = db.Column(db.Boolean, default=False)          # 暖气
#     smoking_allowed = db.Column(db.Boolean, default=False)  # 是否允许吸烟
#     pets_allowed = db.Column(db.Boolean, default=False)     # 是否允许宠物
#     description = db.Column(db.Text)                        # 描述信息

#     def to_dict(self):
#         return {
#             "beds": self.beds,
#             "wifi": self.wifi,
#             "kitchen": self.kitchen,
#             "bathroom": self.bathroom,
#             "balcony": self.balcony,
#             "air_conditioning": self.air_conditioning,
#             "heating": self.heating,
#             "smoking_allowed": self.smoking_allowed,
#             "pets_allowed": self.pets_allowed,
#             "description": self.description
#         }