FROM php:8.1-apache

# Copiar todo el proyecto al directorio web
COPY . /var/www/html/

# Mover el contenido de public a la raíz del servidor web
RUN mv /var/www/html/public/* /var/www/html/ && \
    mv /var/www/html/public/.htaccess /var/www/html/ 2>/dev/null || true

# Mover includes a la raíz del servidor web
RUN mv /var/www/html/includes/ /var/www/html/ 2>/dev/null || true

# Mover admin si quieres acceder vía web
RUN mv /var/www/html/admin/ /var/www/html/ 2>/dev/null || true

# Mover imágenes
RUN mv /var/www/html/imagenes/ /var/www/html/ 2>/dev/null || true

# Habilitar mod_rewrite
RUN a2enmod rewrite

# Configurar permisos
RUN chown -R www-data:www-data /var/www/html

EXPOSE 80
