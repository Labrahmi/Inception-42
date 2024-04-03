FROM debian:bookworm

# Install Nginx and OpenSSL
RUN apt-get update \
    && apt-get install -y nginx openssl

# Remove the default Nginx configuration
RUN mv /etc/nginx/nginx.conf /etc/nginx/nginx_old.conf

# Generate a self-signed SSL certificate
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/cert.key -out /etc/nginx/cert.crt \
    -subj "/C=US/ST=Tetouan/L=Martil/O=LEET/CN=ylabrahm.42.fr"

# Copy your Nginx configuration file
COPY conf/nginx.conf /etc/nginx/nginx.conf

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]
