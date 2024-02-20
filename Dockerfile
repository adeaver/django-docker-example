FROM python:3.12-slim-bullseye

WORKDIR /app

RUN apt-get update -y
RUN pip3 install poetry

COPY pyproject.toml .
COPY poetry.lock .

RUN poetry install --no-root

CMD [ "poetry", "run", "python3", "manage.py", "runserver", "0.0.0.0:8000" ]
