FROM ubuntu:18.04

EXPOSE 8080

COPY /usr/website /usr/share/nginx/html
