FROM python:3.9.1-alpine3.12

COPY . /app

WORKDIR /app/

# Create a non-root user and set file permissions
RUN addgroup -S app \
    && adduser -S -g app -u 1000 app \
    && chown -R app:app /app

# Run as the non-root user (specify UID rather than username)
USER 1000

RUN pip install -r requirements.txt

ENTRYPOINT ["python"]

EXPOSE 5000

CMD ["app.py"]
