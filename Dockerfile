FROM percona:5.6.29

COPY dawnbreaks_mysql2redis.git /usr/local/src/dawnbreaks_mysql2redis.git

RUN  apt-get update && apt-get install -y libjemalloc-dev libhiredis-dev libapr1-dev libaprutil1-dev  gcc make   libmysqlclient-dev && \
ln -s /usr/include/apr-1.0 /usr/include/apr-1 && \
cd /usr/local/src/dawnbreaks_mysql2redis.git && \
make &&  make install 

#COPY conf.d /etc/mysql/conf.d
#RUN	echo '!includedir /etc/mysql/conf.d/' > /etc/mysql/my.cnf
RUN mkdir /tmp/mysqltmp && \
chmod 777 /tmp/mysqltmp && \
chown -R mysql:mysql /etc/mysql/conf.d 

