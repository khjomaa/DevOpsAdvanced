FROM nginx:mainline-alpine

RUN rm /etc/nginx/conf.d/*

ADD nginx.conf /etc/nginx/conf.d/

ADD src/ /usr/share/nginx/html/