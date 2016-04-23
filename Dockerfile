FROM ubuntu:latest

ENTRYPOINT ["hhvm"]

CMD ["--mode","server","--config","/etc/hhvm/php.ini","--config","/etc/hhvm/server.ini","--user","www-data","-vPidFile=/var/run/hhvm/pid"]

RUN sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 5A16E7281BE7A449 \
 && echo "deb http://dl.hhvm.com/ubuntu trusty main" >> /etc/apt/sources.list

RUN apt-get update
RUN \
	apt-get upgrade -y -q -o Dpkg::Options::="--force-confold" \
 && apt-get install hhvm -y -q
#RUN mkdir -p /var/run/nginx \
# && mkdir -p /etc/nginx \
# && mkdir -p /var/log/nginx \
# && mkdir -p /var/lib/nginx/tmp

#VOLUME ["/etc/coconf/nginx","/etc/nginx"]

EXPOSE 9000

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
