FROM ubuntu:precise
MAINTAINER bobtfish@bobtfish.net

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -qq -y && \
    apt-get install -qq -y ruby1.9.3 ruby-bundler build-essential git-core && \
    apt-get clean

RUN git clone https://github.com/bobtfish/synapse.git
RUN cd synapse;git checkout etcd_service_watcher;gem build *.gemspec;gem install *.gem

ADD /synapse.conf.json /synapse.conf.json
ADD /start-synapse.sh /start-synapse.sh
ADD /run.sh /run.sh

ADD /supervisord-synapse.conf /etc/supervisor/conf.d/supervisord-synapse.conf
RUN chmod 755 /*.sh

CMD ["/run.sh"]

