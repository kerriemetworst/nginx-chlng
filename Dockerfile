# Dockerfile for endocode challenge CI/CD
# using the ubuntu base image as distro
FROM ubuntu:18.04

# make sure dependencies for nginx are met
RUN apt-get update && apt-get -y install build-essential zlib1g-dev libpcre3-dev openssl libc6-dev

#add a directory for the code to 'land'
RUN mkdir /home/endocode

#copy code for compilation in the made directory
COPY ./ /home/endocode/

#use  the directory as working directory
WORKDIR /home/endocode

# configure the code
RUN ./configure

# compile the code
RUN make

# install compiled code
RUN make install

EXPOSE 80

STOPSIGNAL SIGTERM

CMD ["/usr/local/nginx/sbin/nginx", "-g", "daemon off;"]
