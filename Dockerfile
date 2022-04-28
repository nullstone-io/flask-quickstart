FROM python:3.8-alpine

WORKDIR /app
COPY requirements.txt .
RUN pip3 install -r requirements.txt

COPY . .

EXPOSE 80

CMD ["gunicorn", "app:app", "-b 0.0.0.0:80"]
