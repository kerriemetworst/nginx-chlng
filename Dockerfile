FROM ubuntu:18.04

RUN apt-get update && apt-get -y install build-essential
RUN mkdir /home/endocode
COPY ./ /home/endocode/

WORKDIR /home/endocode

RUN whoami

RUN make install

RUN nginx -V

EXPOSE 80

STOPSIGNAL SIGTERM

CMD ["nginx", "-g", "daemon off;"]
