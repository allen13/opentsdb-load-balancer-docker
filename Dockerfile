FROM phusion/baseimage:0.9.15

RUN add-apt-repository ppa:vbernat/haproxy-1.5

RUN DEBIAN_FRONTEND=noninteractive apt-get -y update && \
    apt-get install -y haproxy && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

#Install haproxy confd tasks and templates
RUN mkdir -p /etc/confd/conf.d
RUN mkdir -p /etc/confd/templates
COPY config/haproxy.toml /etc/confd/conf.d/haproxy.toml
COPY config/haproxy.cfg.tmpl /etc/confd/templates/haproxy.cfg.tmpl

#Install confd
ADD https://github.com/kelseyhightower/confd/releases/download/v0.7.1/confd-0.7.1-linux-amd64 /usr/bin/confd
RUN chmod 111 /usr/bin/confd
COPY config/haproxy.cfg /etc/haproxy/haproxy.cfg

ADD service/. /etc/service/

EXPOSE 4242

CMD ["/sbin/my_init"]
