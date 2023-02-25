import logging
import unittest

from tasted.tests.setup import app, client


class BaseTest(unittest.TestCase):
    def setUp(self):
        self.app = app
        self.client = client

        logging.basicConfig()
        logging.getLogger("sqlalchemy.engine").setLevel(logging.INFO)
