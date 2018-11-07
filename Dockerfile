FROM debian:8

ENV RPC_USER emeruser
ENV RPC_PASS paSSwdNeedToChang# 
ENV RPC_ALLOW_IP 127.0.0.1/32
ENV MAX_CONNECTIONS 15
ENV RPC_PORT 9081
ENV PORT 6662
ENV DEBIAN_FRONTEND noninteractive
ENV TESTNET 0

RUN apt-get update \
  && apt -y install software-properties-common apt-transport-https \
  && apt-key adv --keyserver keyserver.ubuntu.com --recv B58C58F4 \
  && add-apt-repository 'deb http://download.emercoin.com/debian jessie emercoin'
RUN apt-get update \
  && apt-get install -y wget tar libdb4.8 libdb4.8++ libdb4.8++-dev libdb4.8-dev  build-essential libboost-all-dev autoconf libssl-dev pkg-config autotools-dev libminiupnpc-dev libcurl4-openssl-dev libevent-dev libz-dev libgmp-dev \
  && rm -rf /var/lib/apt/lists/*

RUN wget https://github.com/emercoin/emercoin/releases/download/v0.7.2emc/emercoin-0.7.2-x86_64-linux-gnu.tar.gz
RUN tar xvfz emercoin-0.7.2-x86_64-linux-gnu.tar.gz -C /

COPY docker-entrypoint.sh /usr/local/bin/
ENTRYPOINT ["docker-entrypoint.sh"]

EXPOSE 8332 8333
VOLUME ["/data/emercoin"]
CMD ["/usr/bin/emercoind", "-datadir=/data/emercoin", "-printtoconsole"]

