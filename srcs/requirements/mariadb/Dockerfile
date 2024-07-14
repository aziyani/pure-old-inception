
FROM debian:12.5

RUN apt-get update && apt-get install -y mariadb-server

# prepare the directory /run/mysqld for mariadb's runtime operations.
RUN mkdir -p /run/mysqld && chown -R mysql:mysql /run/mysqld && chmod 777 /run/mysqld

# Copy the script that will initialize the database
COPY ./conf/mariadb.sh /

# +x : give execution permission to the script
RUN chmod +x /mariadb.sh

ENTRYPOINT ["sh","/mariadb.sh"]

# Start MariaDB in the foreground
CMD ["mariadbd", "--user=mysql", "--bind-address=0.0.0.0"]