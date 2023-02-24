import os


class Config:
    """Base configuration."""

    APP_DIR = os.path.abspath(os.path.dirname(__file__))
    PROJECT_ROOT = os.path.abspath(os.path.join(APP_DIR, os.pardir))

    # https://flask.palletsprojects.com/en/2.2.x/config/
    SECRET_KEY = os.environ.get('SECRET_KEY', 'supersecretkey')

    # https://flask-sqlalchemy.palletsprojects.com/en/2.x/config/
    SQLALCHEMY_TRACK_MODIFICATIONS = False
    SQLALCHEMY_ECHO = False

    # database connection
    POSTGRES_USER = os.environ.get('POSTGRES_USER', 'tastebudsd')
    POSTGRES_PASSWORD = os.environ.get('POSTGRES_PASSWORD', 'supersecretpassword')
    POSTGRES_HOST = os.environ.get('POSTGRES_HOST', 'localhost')
    POSTGRES_PORT = os.environ.get('POSTGRES_PORT', 5433)
    POSTGRES_DATABASE = os.environ.get('POSTGRES_DB', 'tastebuds')
    SQLALCHEMY_DATABASE_URI = f'postgresql://{POSTGRES_USER}:{POSTGRES_PASSWORD}@{POSTGRES_HOST}:{POSTGRES_PORT}/' \
                              f'{POSTGRES_DATABASE}'

class ProdConfig(Config):
    """Production configuration."""

    ENV = 'production'
    DEBUG = False

class DevConfig(Config):
    """Development configuration."""

    ENV = 'development'
    DEBUG = True

    SQLALCHEMY_ECHO = True