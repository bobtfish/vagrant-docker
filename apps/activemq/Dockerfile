FROM ubuntu

MAINTAINER Tomas Doran <bobtfish@bobtfish.net>

RUN echo "Acquire::http::Proxy \"http://172.16.234.1:8080\";" >> /etc/apt/apt.conf
RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y git-core subversion git-svn vim wget nmap

RUN apt-get -y install software-properties-common python-software-properties
RUN add-apt-repository ppa:webupd8team/java
RUN apt-get update
RUN echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections
RUN apt-get install -y oracle-java7-installer
RUN update-java-alternatives -s java-7-oracle
RUN wget http://mirror.metrocast.net/apache/activemq/apache-activemq/5.8.0/apache-activemq-5.8.0-bin.tar.gz -O /tmp/apache-activemq-5.8.0-bin.tar.gz
RUN tar xzf /tmp/apache-activemq-5.8.0-bin.tar.gz -C /tmp
ADD activemq.xml /tmp/apache-activemq-5.8.0/conf/activemq.xml
RUN mv /tmp/apache-activemq-5.8.0 /opt/activemq
RUN /opt/activemq/bin/activemq setup /etc/default/activemq

EXPOSE 61616:61616
EXPOSE 5672:5672
EXPOSE 61612:61612
EXPOSE 61613:61613
EXPOSE 8161:8161

ENTRYPOINT /opt/activemq/bin/activemq start ;/bin/bash

