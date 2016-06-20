FROM ubuntu:xenial

ENTRYPOINT ["hhvm"]

CMD ["--mode","server","--config","/etc/hhvm/php.ini","--config","/etc/hhvm/server.ini","--user","www-data","-vPidFile=/var/run/hhvm/pid"]

RUN sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 5A16E7281BE7A449 \
 && echo "deb http://dl.hhvm.com/ubuntu xenial main" >> /etc/apt/sources.list

RUN apt-get update
RUN \
	apt-get upgrade -y -q -o Dpkg::Options::="--force-confold" \
 && apt-get install hhvm -y -q \
 && apt-get install libnuma1 -y -q

EXPOSE 9000

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
