FROM centos:centos6

MAINTAINER Stuart Munro <stuart@munro.co>

ENV HOME /root

RUN rpm -Uvh https://yum.newrelic.com/pub/newrelic/el5/x86_64/newrelic-repo-5-3.noarch.rpm
RUN rpm -Uvh http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
RUN yum clean all

RUN yum install -y wget tar swig gcc gcc-c++ bzip2 bzip2-devel mysql mysql-server mysql-devel gettext python-pip libjpeg-turbo zlib libtiff freetype lcms2 libjpeg-turbo-devel libtiff-devel zlib-devel freetype-devel lcms2-devel libmemcached-devel xorg-x11-server-Xvfb xorg-x11-server-Xephyr xorg-x11-server-Xvfb

ADD install_python.sh /root/install_python.sh
RUN chmod 755 /root/install_python.sh
RUN /root/install_python.sh

RUN /usr/local/bin/pip install supervisor
RUN mkdir -p /etc/supervisor.d
ADD supervisord.init /etc/init.d/supervisord
ADD supervisord.conf /etc/supervisord.conf
RUN chmod 755 /etc/init.d/supervisord
