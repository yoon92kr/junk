from flask import Flask

app = Flask(__name__)   # Flask 객체 생성

# 파일 이름이 index.py이므로
from app.main.index import main as main

app.register_blueprint(main)