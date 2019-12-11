FROM ubuntu:18.04

RUN apt-get update && apt-get -y install build-essential zlib1g libpcre3 openssl gcc libc6

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
