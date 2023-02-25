from tasted.tests.base_test import BaseTest


class FeedTest(BaseTest):
    def test_get_feed(self):
        response = self.client().get("http://127.0.0.1:5000/api/v1/feed")
        self.assertEqual(200, response.status_code)

        print(response.json)
        self.assertEqual(4, len(response.json["reviews"]))
