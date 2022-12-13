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
        libmcpp-dev

RUN git clone -b Pacemaker-2.1.5 -- https://github.com/ClusterLabs/pacemaker.git
#	cd pacemaker

#RUN apt-get install autopoint
#WORKDIR pacemaker
#RUN cd pacemaker
WORKDIR pacemaker
RUN apt-get -y install autopoint gettext
RUN apt update
RUN apt -y install software-properties-common
RUN add-apt-repository ppa:deadsnakes/ppa
#RUN apt-get -y update
RUN apt -y install python3.9
#WORKDIR pacemaker
#RUN python -v
#RUN apt-get update && \
#	apt-get -y install python3
#RUN cd /usr/bin && \
#	ln -s ./python3 ./python
RUN ./autogen.sh 
RUN ./configure 
RUN make 
RUN make install
RUN make check
CMD /etc/init.d/corosync start && /etc/init.d/pacemaker start && /bin/bash
