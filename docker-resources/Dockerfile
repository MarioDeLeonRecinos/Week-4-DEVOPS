FROM nginx:latest AS nginx
LABEL nginx="Nginx modified"
COPY ./docker-resources/nginx.conf /etc/nginx/
COPY ./public/ /var/www/html

RUN apt-get update \
    && apt-get install -y \
    apache2-utils vim nano

HEALTHCHECK CMD curl --fail http://localhost:80