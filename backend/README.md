# tastebuds backend

## Components

### tasted
`tasted`, which stands for `taste daemon`, is our frontend HTTP server. This daemon serves traffic for our public facing API.

## Installation

Official requirements are (but this probably works with other versions too):
* `python 3.10`, which we assume is `python3.10` on the CLI
* `docker 20.10` which we assume is `docker` on the CLI
* `docker compose 2.7` which we assume is `docker-compose` on the CLI

### Set up python
1. `$ sudo add-apt-repository ppa:deadsnakes/ppa`
2. `$ sudo apt update`
3. `$ sudo apt install python3.10`
4. `$ sudo apt install python3.10-venv`
5. `$ python3.10 -m venv venv`
6. `$ source venv/bin/activate`
7. `$ sudo apt-get install python-psycopg2`
8. `$ pip install -r requirements.txt`

## Running development environment
1. `$ source venv/bin/activate`
2. `$ docker-compose -f docker-compose.dev.yaml up postgres -d`
3. Wait until the postgres server is up & healthy, then run `$ python3.10 createdb.py --drop --dummy`
3. `$ cd tasted && flask run --debug`

## Running unit tests
Currently, unit tests use the same postgres database as the development environment, so make sure that your developer environment's postgres is running & that the database has been reset.

vscode is configured to automatical detect unit tests, so to run a test go to a file and click the play icon.

## Set up Git Pre-commit Hooks
1. `$ pre-commit install`

## API spec
`GET /api/v1/feed`
```json
{
    "reviews": [
        {
            "id": "af449c80-87bc-4ba4-98bb-cf4293c5ea9c",
            "created_at": "2023-02-23T18:25:43.511Z",
            "text_content": "🔥",
            "user": {
                "id": "af467260-d28d-4d4f-8f56-8082ec02686d",
                "first_name": "Amar",
                "last_name": "Ramachandran"
            },
            "restaurant": {
                "id": "637982cf-5ba2-417e-a26c-31e898f12463",
                "name": "Viva Goa"
            }
        }
    ]
}
```
