from flask import Flask

app = Flask(__name__)

from app.controllers import app_controller # noqa: E402
