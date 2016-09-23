FROM mysql:latest

MAINTAINER erichen86 <erichen86@gmail.com>

# Write Permission
RUN usermod -u 1000 mysql && chown mysql.mysql /var/run/mysqld/

ADD my.cnf /etc/mysql/conf.d/my.cnf

CMD ["mysqld"]

EXPOSE 3306

VOLUME ["/opt"]