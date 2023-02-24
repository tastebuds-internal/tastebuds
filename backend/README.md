# tastebuds backend

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
7. `$ pip install -r requirements.txt`

## Running development environment
1. `$ source venv/bin/activate`
2. `$ docker-compose -f docker-compose.dev.yaml up postgres -d`
3. `$ cd tastebudsd && flask run --debug`