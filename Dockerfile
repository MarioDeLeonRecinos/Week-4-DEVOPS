FROM nginx:latest AS nginx
ARG USER=user1
ARG PASSWORD=user1
LABEL nginx="Nginx modified"
COPY ./docker-resources/nginx.conf /etc/nginx/
COPY ./public/ /var/www/html
COPY ./docker-resources/script_2 /
COPY ./createPassUser.txt /

RUN apt-get update \
    && apt-get install -y \
    apache2-utils vim nano
RUN touch /etc/nginx/.htpasswd
RUN htpasswd -b "/etc/nginx/.htpasswd" "$USER" "$PASSWORD"
RUN ./script_2
RUN rm ./script_2 ./createPassUser.txt
#test