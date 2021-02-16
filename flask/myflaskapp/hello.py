from flask import Flask, request
from werkzeug.utils import secure_filename
app = Flask(__name__, template_folder='template')

@app.route('/upload', methods=['GET', 'POST'])
def upload_file():
    if request.method == 'POST':
        f = request.files['the_file']
        f.save('/z/Shared' + secure_filename(f.filename))
