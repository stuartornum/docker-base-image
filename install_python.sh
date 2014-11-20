#!/bin/bash

if [ ! -f /usr/local/bin/python2.7 ]; then
  cd /tmp
  wget https://www.python.org/ftp/python/2.7.7/Python-2.7.7.tgz --no-check-certificate
  tar zxvf Python-2.7.7.tgz
  cd Python-2.7.7
  ./configure --prefix=/usr/local
  make
  make altinstall
fi

# Install Setuptools
if [ ! -f /usr/local/lib/python2.7/site-packages/setuptools.pth ]; then
  cd /tmp
  wget https://pypi.python.org/packages/source/s/setuptools/setuptools-5.4.tar.gz#md5=cecc6d68d76d9f29dabe39247233f8c7 --no-check-certificate
  tar zxvf setuptools-5.4.tar.gz
  cd setuptools-5.4
  /usr/local/bin/python2.7 setup.py install
fi


## Install pip
if [ ! -f /usr/local/bin/pip ]; then
  cd /tmp
  wget https://pypi.python.org/packages/source/p/pip/pip-1.5.6.tar.gz#md5=01026f87978932060cc86c1dc527903e --no-check-certificate
  tar zxvf pip-1.5.6.tar.gz
  cd pip-1.5.6
  /usr/local/bin/python2.7 setup.py install
fi

