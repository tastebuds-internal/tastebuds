from flask_restful import fields

from tasted.models.review_model import review_model

feed_model = {"reviews": fields.List(fields.Nested(review_model))}
