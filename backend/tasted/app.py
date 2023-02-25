from flask import Blueprint, Flask
from flask.helpers import get_debug_flag
from flask_restful import Api
from tasted.api.feed import Feed
from tasted.configs import DevConfig, ProdConfig

from common.daos.base import db


def create_app(config_object=ProdConfig):
    if get_debug_flag():
        config_object = DevConfig

    app = Flask(__name__.split(".")[0])
    app.url_map.strict_slashes = False
    app.config.from_object(config_object)

    db.init_app(app)

    create_api(app)

    return app


def create_api(app):
    api_bp = Blueprint("api", __name__, url_prefix="/api/v1")
    api = Api(api_bp, catch_all_404s=True)

    api.add_resource(Feed, "/feed")

    app.register_blueprint(api_bp)
