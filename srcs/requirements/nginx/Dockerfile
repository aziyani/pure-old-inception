# File: srcs/requirements/nginx/Dockerfile

FROM debian:12.5

# Install Nginx and OpenSSL
RUN apt-get update && apt-get install -y nginx openssl

# Create self-signed SSL certificate
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt -subj "/C=US/ST=Denial/L=Springfield/O=Dis/CN=www.example.com"

# Copy custom Nginx configuration
COPY ./conf/nginx.conf /etc/nginx/conf.d/

# Start Nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]