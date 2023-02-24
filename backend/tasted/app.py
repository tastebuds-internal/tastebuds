from flask import Blueprint, Flask
from tasted.settings import ProdConfig


def create_app(config_object=ProdConfig):
    app = Flask(__name__.split('.')[0])
    app.url_map.strict_slashes = False
    app.config.from_object(config_object)

    create_api(app)

    return app

def create_api(app):
    api_bp = Blueprint('api', __name__, url_prefix='/api/v1')
    app.register_blueprint(api_bp)