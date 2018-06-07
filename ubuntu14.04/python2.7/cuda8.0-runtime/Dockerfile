FROM nvidia/cuda:8.0-runtime-ubuntu14.04

LABEL maintainer "CloudCV Team <team@cloudcv.org>"
LABEL version "0.1"

ENV DEBIAN_FRONTEND noninteractive

ENV LANG C.UTF-8
ENV PYTHONIOENCODING UTF-8

ENV PYTHON_VERSION 2.7.15
ENV PYTHON_PIP_VERSION 10.0.1


RUN apt-get update && \
	apt-get install -y --no-install-recommends build-essential gcc checkinstall libssl-dev libc6-dev \
		dpkg-dev tcl-dev tk-dev wget && \
	rm -rf /var/lib/apt/lists/*

RUN wget "http://www.python.org/ftp/python/${PYTHON_VERSION}/Python-${PYTHON_VERSION}.tgz"

RUN tar xzf "Python-${PYTHON_VERSION}.tgz" && \
	rm "Python-${PYTHON_VERSION}.tgz"

RUN cd "Python-${PYTHON_VERSION}" && \
	./configure --enable-shared && \
	make && \
	make install && \
	cd .. && \
	rm -rf "Python-${PYTHON_VERSION}"

RUN apt-get purge -y --auto-remove dpkg-dev tcl-dev tk-dev

ENV LD_LIBRARY_PATH "/usr/local/lib:/usr/local/bin/python:${LD_LIBRARY_PATH}"

RUN apt-get update && apt-get -y install libssl-dev

RUN wget -O get-pip.py "https://bootstrap.pypa.io/get-pip.py"
RUN python get-pip.py \
		--disable-pip-version-check \
		--no-cache-dir "pip==${PYTHON_PIP_VERSION}"
RUN rm -f get-pip.py
RUN pip install --no-cache-dir virtualenv
RUN pip install setuptools
