FROM python:3.7.7-slim
LABEL Obakeng Maikano <obmakno@gmail.com>

ENV INSTALL_PATH /dicesaas
RUN mkdir -p $INSTALL_PATH

WORKDIR $INSTALL_PATH

COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

COPY . .

CMD gunicorn -b 0.0.0.0:8000 --access-logfile - "dicesaas.app:create_app()"
