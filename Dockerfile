FROM python:3.8

COPY . /app

WORKDIR /app/

RUN pip install -r requirements.txt

ENTRYPOINT ["python"]

EXPOSE 5000

RUN addgroup -S app \
    && adduser -S -g app -u 1000 app \
    && chown -R app:app /app

USER 1000

CMD ["app.py"]
