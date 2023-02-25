from flask_restful import fields

user_model = {
    "id": fields.String,
    "first_name": fields.String,
    "last_name": fields.String,
}
