# Upload File

## Practical
Code:
```
from flask import Flask, request
from werkzeug.utils import secure_filename
app = Flask(__name__, template_folder='template')

@app.route('/upload', methods=['GET', 'POST'])
def upload_file():
    if request.method == 'POST':
        f = request.files['the_file']
        f.save('/z/Shared' + secure_filename(f.filename))
```
        
Html:

```
<!DOCTYPE html>
<title>Upload</title>
<form action="/upload" enctype="multipart/form-data" method="POST">
    <input type="file" id="myFile" name="filename">
    <input type="submit">
  </form>
```

### Next
[Flask injection](../05-Flask-injection/README.md)
