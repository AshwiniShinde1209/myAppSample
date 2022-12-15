FROM ppc64le/ubuntu:16.04

MAINTAINER "Meghali Dhoble <dhoblem@us.ibm.com>","Ashwini Shinde <Ashwini.Shinde4@ibm.com>"

RUN apt-get update && apt-get install -y apt-utils \
        build-essential \
        gcc \
        g++ \
        llvm \
        autoconf \
        clang \
        corosync-dev \
        libcorosync-common-dev \
        cppcheck \
        crmsh \
        libbz2-dev \
        libcfg-dev \
        libcpg-dev \
        libdbus-1-dev \
        libtool \
        libxml2-dev \
        libxslt1-dev \
        git \
        libglib2.0-dev \
        make \
        pkg-config \
        uuid-dev \
        libcmap-dev \
        libquorum-dev \
        libmcpp-dev \
        libcmocka-dev \
        automake \
        libltdl-dev \
        libqb-dev \
        autopoint \
        gettext

RUN apt update && \
        apt -y install software-properties-common && \
        add-apt-repository ppa:deadsnakes/ppa && \
        apt -y install python3.9

RUN git clone -b Pacemaker-2.1.5 -- https://github.com/ClusterLabs/pacemaker.git

WORKDIR pacemaker

RUN ./autogen.sh && ./configure && make && make install

CMD /etc/init.d/corosync start && /etc/init.d/pacemaker start && /bin/bash

