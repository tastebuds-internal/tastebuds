# tastebuds backend


## API spec

`GET /feeds/following`
```json
{
    "reviews": [
        {
            "id": "af449c80-87bc-4ba4-98bb-cf4293c5ea9c",
            "created_date": "",
            "text_content": "",
            "user": {
                "id": "af467260-d28d-4d4f-8f56-8082ec02686d",
                "first_name": "",
                "last_name": ""
            },
            "restaurant": {
                "id": "637982cf-5ba2-417e-a26c-31e898f12463",
                "name": ""
            },
            "restaurant_menu_items": [
                {
                    "id": "3846c42a-b99c-4399-a9bb-8558c041d2f0",
                    "restaurant_id": "637982cf-5ba2-417e-a26c-31e898f12463",
                    "name": ""
                },
                ...
            ]
        },
        ...
    ]
}
```