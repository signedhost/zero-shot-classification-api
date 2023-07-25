# Copyright 2016 - 2023 MalwarePad Productions, Ella

FROM python
WORKDIR /app

COPY . /app

RUN apk add --no-cache --virtual .build-deps gcc musl-dev

RUN pip install --no-cache-dir flask transformers tensorflow flask 

RUN apk del .build-deps gcc musl-dev

EXPOSE 2359

ENV NAME ZeroShotClassification

CMD ["python", "main.py"]
