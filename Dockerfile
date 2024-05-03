FROM python:3.9.19-bullseye

LABEL maintainer="dhanooponline@gmail.com"

COPY . /app

WORKDIR /app

RUN pip install -r requirements.txt

EXPOSE 8080

ENTRYPOINT ["python"]

CMD ["app.py"]
