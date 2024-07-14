FROM debian:12.5

RUN apt-get update -y

RUN apt install -y php8.2-fpm

RUN apt install -y php8.2-mysql

RUN apt install -y curl

COPY ./conf/wordpress.sh .

RUN chmod +x wordpress.sh

CMD [ "sh", "wordpress.sh" ]
# CMD ["yes"]
