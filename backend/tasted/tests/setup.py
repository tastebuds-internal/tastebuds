from sqlalchemy import text
from common.daos.base import db

from tasted.app import create_app
from tasted.configs import Config


class TestConfig(Config):
    """Test configuration."""

    # TODO(amar): separate postgres database

    ENV = "test"
    SQLALCHEMY_ECHO = True
    TESTING = True


app = create_app(TestConfig)
client = app.test_client
