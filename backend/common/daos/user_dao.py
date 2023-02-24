import uuid
from .base import db
from sqlalchemy import Text
from sqlalchemy.dialects.postgresql import UUID


class UserDao(db.Model):
    __tablename__ = "users"

    id = db.Column(UUID, default=uuid.uuid4, nullable=False, primary_key=True)
    first_name = db.Column(Text, nullable=False)
    last_name = db.Column(Text, nullable=False)

    reviews = db.relationship("ReviewDao", back_populates="user")

    @classmethod
    def get_by_id(cls, _id):
        return cls.query.get(_id)

    def __eq__(self, other):
        return type(self) is type(other) and self.id == other.id

    def __ne__(self, other):
        return not self.__eq__(other)
