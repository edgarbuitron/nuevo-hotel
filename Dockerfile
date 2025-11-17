FROM php:8.1-apache

# Copiar TODO el proyecto
COPY . /var/www/html/

# Configurar Apache para usar index.php
RUN echo "DirectoryIndex index.php index.html" >> /etc/apache2/apache2.conf

# Habilitar mod_rewrite
RUN a2enmod rewrite

# Configurar permisos
RUN chown -R www-data:www-data /var/www/html

EXPOSE 80
