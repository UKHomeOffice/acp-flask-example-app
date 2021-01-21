FROM python:3.9.1-alpine3.12

COPY . /app

WORKDIR /app/

RUN pip install -r requirements.txt

ENTRYPOINT ["python"]

EXPOSE 5000

CMD ["app.py"]
