from flask import Flask, render_template

app = Flask(__name__)
app.secret_key = '12345'


@app.route('/')
def home():
    return render_template('index.html')


if __name__ == '__main__':
    app.run()
