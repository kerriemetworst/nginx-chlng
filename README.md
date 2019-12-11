# nginx-chlng

See details of my files in Dockerfile for building the docker image and Jenkinsfile for the jenkinsfile.

The CICDnomnomnomnomerror.txt contains the printout of the error when building the project.
In line 196 is clearly stated that a header file for the compilation of nginx is missing. This file is not in the package.
After commenting out line 71 in src/core/ngx_core.h where the #include <ngx_nomnomnom.h> is added, nginx compiles just fine and runs as well.  
