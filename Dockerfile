FROM python:3

ADD crypto_run.py /

ADD requirements.txt /

ADD crypto_config.yaml /

ADD crypto_cache.json /

ADD crypto_cache.py /

RUN pip install -r requirements.txt

RUN pip install discord 

CMD [ "python", "./crypto_run.py", "-t", "AKT" ]

