FROM ubuntu:20.04

EXPOSE 10080

RUN printf "\
deb http://archive.ubuntu.com/ubuntu/ focal main restricted universe multiverse\n\
#deb-src http://archive.ubuntu.com/ubuntu/ focal main restricted universe multiverse\n\
deb http://archive.ubuntu.com/ubuntu/ focal-updates main restricted universe multiverse\n\
#deb-src http://archive.ubuntu.com/ubuntu/ focal-updates main restricted universe multiverse\n\
deb http://archive.ubuntu.com/ubuntu/ focal-security main restricted universe multiverse\n\
#deb-src http://archive.ubuntu.com/ubuntu/ focal-security main restricted universe multiverse\n\
deb http://archive.ubuntu.com/ubuntu/ focal-backports main restricted universe multiverse\n\
#deb-src http://archive.ubuntu.com/ubuntu/ focal-backports main restricted universe multiverse\n\
deb http://archive.canonical.com/ubuntu focal partner\n\
#deb-src http://archive.canonical.com/ubuntu focal partner\n\
" > /etc/apt/sources.list

RUN apt-get update && apt-get dist-upgrade && apt-get -y autoremove

RUN apt-get install -y openssh-server

ADD https://github.com/erebe/wstunnel/releases/download/v4.0/wstunnel-x64-linux /usr/local/bin/wstunnel
RUN chmod +x /usr/local/bin/wstunnel

RUN apt-get install -y nginx

RUN apt-get install -y supervisor

RUN echo "root:root!" | chpasswd

COPY ./entrypoint.sh /usr/local/bin
RUN chmod +x /usr/local/bin/entrypoint.sh

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]