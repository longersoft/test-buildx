FROM --platform=$TARGETPLATFORM python:3.7

WORKDIR /app

RUN pip3 install pytest

COPY . .

CMD [ "python3", "cotu.py"]
