FROM php:8.1-apache

# Copiar solo el contenido esencial
COPY public/ /var/www/html/
COPY includes/ /var/www/html/includes/
COPY admin/ /var/www/html/admin/ 
COPY imagenes/ /var/www/html/imagenes/

# Configurar Apache para usar index.php
RUN echo "DirectoryIndex index.php index.html" >> /etc/apache2/apache2.conf

# Habilitar mod_rewrite
RUN a2enmod rewrite

# Configurar permisos
RUN chown -R www-data:www-data /var/www/html

EXPOSE 80
