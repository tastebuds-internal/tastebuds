from flask_restful import fields

from tasted.models.restaurant_model import restaurant_model
from tasted.models.user_model import user_model

review_model = {
    "id": fields.String,
    "created_at": fields.DateTime,
    "text_content": fields.String,
    "user": fields.Nested(user_model),
    "restaurant": fields.Nested(restaurant_model),
}
