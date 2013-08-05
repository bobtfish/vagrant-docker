FROM ubuntu

MAINTAINER Tomas Doran <bobtfish@bobtfish.net>

RUN echo "Acquire::http::Proxy \"http://172.16.234.1:8080\";" >> /etc/apt/apt.conf
RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install git-core subversion git-svn vim
RUN wget http://www.rabbitmq.com/releases/rabbitmq-server/v3.1.3/rabbitmq-server_3.1.3-1_all.deb -O/tmp/rabbitmq-server_3.1.3-1_all.deb
RUN dpkg -i /tmp/rabbitmq-server_3.1.3-1_all.deb
RUN rm /tmp/rabbitmq-server_3.1.3-1_all.deb

ENTRYPOINT ["/bin/true"]

