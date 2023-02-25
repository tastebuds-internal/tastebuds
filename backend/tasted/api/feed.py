from flask import request
from flask_restful import Resource, marshal_with

from common.daos.base import db
from common.daos.review_dao import ReviewDao
from tasted.models.feed_model import feed_model


class Feed(Resource):
    @marshal_with(feed_model)
    def get(self):
        reviews = db.session.query(ReviewDao).all()

        return {"reviews": reviews}
