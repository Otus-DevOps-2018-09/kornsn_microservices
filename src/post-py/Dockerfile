FROM python:3.6.8-alpine

ENV POST_DATABASE_HOST=post_db \
  POST_DATABASE=posts

RUN apk update && apk add build-base

WORKDIR /app

COPY requirements.txt .
RUN pip install -r requirements.txt
COPY . .

CMD ["python3", "post_app.py"]
