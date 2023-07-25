# Copyright 2016 - 2023 MalwarePad Productions, Ella

from flask import Flask, request, jsonify
from transformers import pipeline

classifier = pipeline("zero-shot-classification", model="facebook/bart-large-mnli", device=0)

app = Flask(__name__)

@app.route('/classify', methods=['POST'])
def classify_text():
    try:
        data = request.get_json()
        text = data.get('text')
        labels = data.get('labels')

        if text is None or labels is None:
            return jsonify({'success': False, 'msg': 'text and labels must be provided'}), 400

        result = classifier(text, labels)
        classification_result = dict(zip(result['labels'], result['scores']))
        
        dominant_label = max(classification_result, key=classification_result.get)
        
        response = {
            'success': True,
            'classification_result': classification_result,
            'dominant_label': dominant_label
        }
        return jsonify(response)

    except Exception as e:
        return jsonify({'success': False, 'msg': str(e)}), 500

if __name__ == '__main__':
    app.run(host='localhost', port=2359)