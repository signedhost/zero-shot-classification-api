# Copyright 2016 - 2023 MalwarePad Productions, Ella

FROM python
WORKDIR /app

COPY . /app


RUN pip install --no-cache-dir flask transformers tensorflow flask 
EXPOSE 2359

ENV NAME ZeroShotClassification

CMD ["python", "main.py"]
