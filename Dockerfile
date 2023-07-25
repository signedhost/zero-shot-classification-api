# Copyright 2016 - 2023 MalwarePad Productions, Ella

FROM python
WORKDIR /app

COPY . /app

RUN export PROTOCOL_BUFFERS_PYTHON_IMPLEMENTATION=python
RUN pip install --no-cache-dir flask transformers tensorflow flask sentencepiece
EXPOSE 2359

ENV NAME ZeroShotClassification

CMD ["python", "main.py"]
