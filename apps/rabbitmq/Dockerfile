FROM ubuntu

MAINTAINER Tomas Doran <bobtfish@bobtfish.net>

RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
RUN apt-get update
RUN apt-get upgrade -y

RUN wget http://www.rabbitmq.com/releases/rabbitmq-server/v3.1.3/rabbitmq-server_3.1.3-1_all.deb
RUN dpkg -i rabbitmq-server_3.1.3-1_all.deb

ENTRYPOINT ["/bin/true"]

