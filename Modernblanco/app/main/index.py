from webbrowser import get
from flask import Blueprint, request, render_template, flash, redirect, url_for
from flask import current_app as app

# index 파일을 들어갔을 때 어떻게 이름을 설정할지 결정하는 부분이며, url_prefix는 URL을 어떻게 뒤에 붙일지 결정하는 부분입니다.
main = Blueprint('main', __name__, url_prefix='/')
# 파일 내부에서 어떤 경로로 나타낼지 결정하는 부분입니다.
@main.route('/main', methods=['GET'])

# 큰 의미는 없지만, 나중에 url_for에서 사용될 함수 이름을 유심히 봐두시기 바랍니다.
def index():

    testData = 'testData array'

    #  # /main/index.html은 사실 /project_name/app/templates/main/index.html을 가리킵니다.
    return render_template('/main/index.html', testKey = testData)