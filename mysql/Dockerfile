FROM mysql:latest
MAINTAINER Florian Kuhn
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y mysql-server mysql-client
COPY create_webanno_db.sql mysql-init /tmp/

RUN service mysql stop
RUN mysqld_safe --init-file=/tmp/mysql-init &
RUN rm /tmp/mysql-init
RUN mysql -u root -p < /tmp/create_webanno_db.sql

CMD ["service", "mysql", "start"]
