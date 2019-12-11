FROM ubuntu:18.04

RUN apt-get update && apt-get -y install build-essential zlib1g-dev libpcre3-dev openssl-dev gcc-dev libc6-dev

RUN mkdir /home/endocode

COPY ./ /home/endocode/

WORKDIR /home/endocode

RUN ./configure

RUN make

RUN make install

RUN /usr/local/nginx/sbin/nginx -V

EXPOSE 80

STOPSIGNAL SIGTERM

CMD ["nginx", "-g", "daemon off;"]
