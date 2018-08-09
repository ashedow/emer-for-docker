FROM debian:8

COPY ./files.tar.gz /
RUN tar -xvf /files.tar.gz -C /
# COPY ./emercoin.conf /root/.emercoin/emercoin.conf
COPY /emercoin.conf /root/.emercoin/emercoin.conf
# RUN apt-key adv --keyserver keyserver.ubuntu.com --recv B58C58F4
# RUN apt-get -y update 
RUN /bin/emercoind
