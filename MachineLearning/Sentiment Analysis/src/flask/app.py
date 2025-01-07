from flask import Flask
from flask import render_template
from flask import request
import pickle
from voting_ensemble import voting_ensemble

app = Flask(__name__)

@app.route('/')
@app.route('/index')
def index():
    return render_template('index.html')

@app.route('/predict', methods=["POST"])
def predict():
    models = pickle.load(open('models.pkl','rb'))
    vectorizer = pickle.load(open('features.pkl','rb'))

    review = request.form.get("review")

    prediction = voting_ensemble([review], vectorizer, models)[0]

    if prediction == "1":
        prediction_text = "Positive"
    else:
        prediction_text = "Negative"
    return render_template('predict.html', result={'text':review, 'prediction':prediction_text})

app.run(host='0.0.0.0', port=5001)