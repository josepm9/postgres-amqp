FROM postgres:9.6

RUN apt-get -y update \
    && apt-get -y install git postgresql-server-dev-9.6 make gcc \
    && cd /tmp \
    && git clone https://github.com/omniti-labs/pg_amqp.git \
    && cd /tmp/pg_amqp \
    && git checkout 240d477d40c5e7a579b931c98eb29cef4edda164 \
    && make \
    && make install \
    && cd .. \
    && rm -rf pg_amqp \
    && apt-get purge -y git postgresql-server-dev-9.6 make gcc \
    && apt-get autoremove -y \
    && apt-get clean -y
