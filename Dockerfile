#FROM alpine AS stage1
#LABEL maintainer="Collabnix"
#RUN echo "Welcome to Docker Labs!" > /opt/index.html

#FROM nginx:alpine
#LABEL maintainer="Collabnix"
#COPY --from=stage1 /opt/index.html /usr/share/nginx/html/
#ENTRYPOINT ["nginx", "-g", "daemon off;"]

FROM nginx:latest AS nginx
LABEL nginx="Nginx modified"
COPY ./nginx.conf /etc/nginx/
COPY ./public/ /var/www/html

#RUN apt-get update \
#    && apt-get install -y \
#    vim nano
