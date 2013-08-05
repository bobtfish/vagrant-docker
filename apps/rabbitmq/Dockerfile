FROM ubuntu

MAINTAINER Tomas Doran <bobtfish@bobtfish.net>

RUN echo "Acquire::http::Proxy \"http://172.16.234.1:8080\";" >> /etc/apt/apt.conf
RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y git-core subversion git-svn vim wget nmap

RUN apt-get install -y erlang-nox logrotate
RUN wget http://www.rabbitmq.com/releases/rabbitmq-server/v3.1.3/rabbitmq-server_3.1.3-1_all.deb -O /tmp/rabbitmq-server_3.1.3-1_all.deb
RUN dpkg-deb --extract /tmp/rabbitmq-server_3.1.3-1_all.deb /tmp/rabbitmq-server_3.1.3-1
RUN dpkg-deb --control /tmp/rabbitmq-server_3.1.3-1_all.deb /tmp/rabbitmq-server_3.1.3-1/DEBIAN
RUN mv /tmp/rabbitmq-server_3.1.3-1/DEBIAN/postinst /rabbitmq.postinst
RUN dpkg-deb --build /tmp/rabbitmq-server_3.1.3-1
RUN dpkg -i /tmp/rabbitmq-server_3.1.3-1.deb
RUN rm -rf /tmp/rabbitmq-server_3.1.3-1_all.deb /tmp/rabbitmq-server_3.1.3-1
RUN addgroup --system rabbitmq
RUN adduser --system --ingroup rabbitmq --home /var/lib/rabbitmq --no-create-home --gecos "RabbitMQ messaging server" --disabled-login rabbitmq
RUN chown -R rabbitmq:rabbitmq /var/lib/rabbitmq
RUN chown -R rabbitmq:rabbitmq /var/log/rabbitmq
RUN /usr/sbin/rabbitmq-plugins enable rabbitmq_stomp
RUN /usr/sbin/rabbitmq-plugins enable rabbitmq_management

EXPOSE 5672:5672
EXPOSE 61613:61613
EXPOSE 15672:15672
ENTRYPOINT /usr/sbin/rabbitmq-server

