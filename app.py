from flask import Flask, Response
import prometheus_client
from prometheus_client import Counter

app = Flask(__name__)

REQUEST_COUNT = Counter('number_of_requests','The total number of requests')
metrics = {}
metrics ['TOTAL_REQUEST_COUNT'] = REQUEST_COUNT

@app.route('/')
def index():
    REQUEST_COUNT.inc()
    return '<h1>A Basic Flask Application!</h1>'

@app.route('/metrics')
def request_count():
    total = []
    for k,v in metrics.items():
        total.append(prometheus_client.generate_latest(v))
    return Response(total, mimetype = "text/plain")

if __name__ == '__main__':
    app.run(debug=True, host = '0.0.0.0')