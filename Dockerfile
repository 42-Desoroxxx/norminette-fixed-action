FROM python:3.12-slim

WORKDIR /usr/src/norminette

COPY pyproject.toml poetry.lock ./

RUN pip3 install setuptools poetry \
    && poetry config virtualenvs.create false \
    && poetry install --only main --no-root

COPY . .

RUN python3 setup.py install

WORKDIR /code

ENTRYPOINT ["norminette"]
