# nginx-chlng

See details of my files in Dockerfile for building the docker image and Jenkinsfile for the jenkinsfile.

The CICDnomnomnomnomerror.txt contains the printout of the error when building the project. The relevant part is:

'''
make -f objs/Makefile
make[1]: Entering directory '/home/endocode'
cc -c -pipe  -O -W -Wall -Wpointer-arith -Wno-unused-parameter -Werror -g  -I src/core -I src/event -I src/event/modules -I src/os/unix -I objs \
	-o objs/src/core/nginx.o \
	src/core/nginx.c
[91mIn file included from src/core/nginx.c:9:0:
src/core/ngx_core.h:71:10: fatal error: ngx_nomnomnom.h: No such file or directory
 #include <ngx_nomnomnom.h>
          ^~~~~~~~~~~~~~~~~
compilation terminated

'''
In line 196 is clearly stated that a header file for the compilation of nginx is missing. This file is not in the package.
After commenting out line 71 in src/core/ngx_core.h where the #include <ngx_nomnomnom.h> is added, nginx compiles just fine and runs as well.  
