FROM ubuntu

MAINTAINER Tomas Doran <bobtfish@bobtfish.net>

RUN echo "Acquire::http::Proxy \"http://172.16.234.1:8080\";" >> /etc/apt/apt.conf
RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y git-core subversion git-svn vim wget nmap

