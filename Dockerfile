FROM rpmbuild/centos6:latest

USER root
RUN yum update -y \
 && yum install -y rpmdevtools epel-release rpmlint \
 && rm -f /home/builder/.rpmmacros

# latest version of spectool that uses curl and supports #/ for specifying output file
ADD spectool /usr/local/bin
RUN chmod +x /usr/local/bin/spectool

USER builder
CMD /bin/bash
