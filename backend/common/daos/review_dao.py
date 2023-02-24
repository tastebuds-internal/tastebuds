import uuid
from .base import db
from sqlalchemy import DateTime, ForeignKey, Text, func
from sqlalchemy.dialects.postgresql import UUID

class ReviewDao(db.Model):
    __tablename__ = 'reviews'

    id = db.Column(UUID, default=uuid.uuid4, nullable=False, primary_key=True)
    user_id = db.Column(UUID, ForeignKey('users.id'), nullable=False)
    restaurant_id = db.Column(UUID, ForeignKey('restaurants.id'), nullable=False)
    text_content = db.Column(Text, nullable=False)
    created_at = db.Column(DateTime(timezone=True), nullable=False, server_default=func.now())

    user = db.relationship("UserDao", back_populates="reviews")
    restaurant = db.relationship("RestaurantDao", back_populates="restaurants")

    @classmethod
    def get_by_id(cls, _id):
        return cls.query.get(_id)

    def __eq__(self, other):
        return type(self) is type(other) and self.id == other.id

    def __ne__(self, other):
        return not self.__eq__(other)