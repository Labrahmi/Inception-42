FROM debian:bookworm

RUN apt-get update && apt-get install -y mariadb-server

RUN mkdir -p /run/mysqld && chmod 777 /run/mysqld

RUN mkdir -p /home/data && mkdir -p /home/data/tools && mkdir -p /home/data/database

COPY tools/setup.sh /home/data/tools/setup.sh

RUN chmod +x /home/data/tools/setup.sh

EXPOSE 3306

ENTRYPOINT ["sh", "/home/data/tools/setup.sh"]

CMD ["mariadbd", "--user=root", "--bind-address=0.0.0.0"]
