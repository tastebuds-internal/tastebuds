import click
from sqlalchemy import text
from sqlalchemy_utils import drop_database, create_database

from tasted.settings import DevConfig
from common.daos.base import db
from tasted.app import create_app

@click.command()
@click.option('--drop', help='Drop database', is_flag=True)
@click.option('--dummy', help='Insert dummy data', is_flag=True)
def create(drop, dummy):
    app = create_app(DevConfig)
    app.app_context().push()

    if drop:
        db.drop_all()

    db.create_all()

    if dummy:
        devdb_sql = open("devdb.sql").read()

        with db.engine.connect().execution_options(autocommit=True) as conn:
            conn.execute(text(devdb_sql))


if __name__ == '__main__':
    create()