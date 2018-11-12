from app import app
from flask import request


@app.route('/write', methods=['POST'])
def create_task():
    print(request.data)
    return "OK", 201
