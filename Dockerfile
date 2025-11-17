FROM php:8.1-apache

# Copiar todo el proyecto
COPY . /var/www/html/

# Mover contenido de public a la raíz del servidor web
RUN cd /var/www/html/public && \
    cp -r . /var/www/html/ && \
    cp .htaccess /var/www/html/ 2>/dev/null || true

# Mover includes a la raíz del servidor web  
RUN cd /var/www/html && \
    cp -r includes/ /var/www/html/ 2>/dev/null || true

# Mover admin si existe
RUN cd /var/www/html && \
    cp -r admin/ /var/www/html/ 2>/dev/null || true

# Mover imágenes si existe
RUN cd /var/www/html && \
    cp -r imagenes/ /var/www/html/ 2>/dev/null || true

# Habilitar mod_rewrite
RUN a2enmod rewrite

# Configurar permisos
RUN chown -R www-data:www-data /var/www/html

EXPOSE 80
