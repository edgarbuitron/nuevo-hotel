FROM php:8.1-apache

# Copiar solo el contenido de public a la raíz
COPY public/. /var/www/html/

# Configurar Apache
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf && \
    a2enmod rewrite

RUN chown -R www-data:www-data /var/www/html

EXPOSE 80
