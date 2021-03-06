
import requests
import json
import logging
from flask_cors import cross_origin
from flask import Response, request, abort, make_response, jsonify
from chuck.application.improver import improve_joke
from chuck import app

log = logging.getLogger(__name__)


FIRST_NAME = "Ken"
LAST_NAME = "Bedwell"


@cross_origin(headers=['Content-Type'])
@app.route("/jokes/random")
def joke_random():

    joke = requests.get('http://api.icndb.com/jokes/random/?exclude=[explicit]').json()

    return Response(
        json.dumps(
            improve_joke(joke, FIRST_NAME, LAST_NAME)
        ),
        mimetype='application/json'
    )
