import os
from flask import Flask, send_from_directory, jsonify
from datetime import datetime
from pymongo import MongoClient

app = Flask(__name__)

# MongoDB configurations
try:
  app.config['MONGO_USERNAME'] = os.environ['MONGO_USERNAME']
  app.config['MONGO_PASSWORD'] = os.environ['MONGO_PASSWORD']
  app.config['MONGO_DATABASE'] = os.environ['MONGO_DATABASE']
  app.config['MONGO_HOST'] = os.environ['MONGO_HOST']

except KeyError:
  print("[!] Environment variable does not exist")

# MongoDB connection
try:
  client = MongoClient(app.config['MONGO_HOST'], 
                       username=app.config['MONGO_USERNAME'], 
                       password=app.config['MONGO_PASSWORD'], 
                       authSource=app.config['MONGO_DATABASE'])
  db = client[app.config['MONGO_DATABASE']]
except KeyError:
  print("[!] Cannot connect to database")

# Function to convert ObjectId to string
def convert_objectid(collection):
    for data in collection:
        data['_id'] = str(data['_id'])  # Convert ObjectId to string
    return collection

@app.route('/api')
def get_collection():
    try:
      receipts = list(db.receipts.find())
      receipts = convert_objectid(receipts)
      resp = jsonify(receipts=receipts, student=app.config['MONGO_USERNAME'], created=datetime.now())
      resp.status_code = 200  
    except Exception as e:
      print(e)
      resp = jsonify(error="Cannot retrieve data")
      resp.status_code = 404 

    return resp

      

@app.route('/', methods=['GET'])
@app.route('/index')
def index():
    return send_from_directory("static", "index.html")


if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=3000)