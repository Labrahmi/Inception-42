# Use the official Debian Bookworm image
FROM debian:bookworm

# Install required dependencies
RUN apt-get update && apt-get install aptitude -y && \
    aptitude install php8.2 php8.2-cli php8.2-mysql curl php8.2-fpm unzip mariadb-client -y && \
    sed -i 's|listen = /run/php/php8.2-fpm.sock|listen = 0.0.0.0:9000|g' /etc/php/8.2/fpm/pool.d/www.conf

# Install WordPress CLI
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp

# Expose port 9000 for php-fpm
EXPOSE 9000

# Set up the working directory
WORKDIR /var/www/html

# Copy WordPress files
# RUN curl -o wordpress.zip -SL https://wordpress.org/latest.zip && \
#     unzip wordpress.zip && \
#     rm wordpress.zip

# Copy the custom entrypoint script
COPY conf/wp-entrypoint.sh /wp-entrypoint.sh

# Make the entrypoint script executable
RUN chmod +x /wp-entrypoint.sh

# Set the entrypoint script as the container's entrypoint
ENTRYPOINT [ "sh", "/wp-entrypoint.sh" ]

# Command to run on container startup
CMD [ "php-fpm8.2", "-F" ]