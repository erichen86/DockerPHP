FROM nginx:latest

MAINTAINER erichen86 <erichen86@gmail.com>

ADD  nginx.conf      /etc/nginx/nginx.conf
ADD  sites-enabled/*    /etc/nginx/conf.d/

RUN  mkdir /opt/htdocs && mkdir /opt/log && mkdir /opt/log/nginx

RUN  chown -R www-data.www-data /opt/htdocs /opt/log

EXPOSE 80

VOLUME ["/opt"]