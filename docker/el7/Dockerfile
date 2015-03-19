FROM centos:7
MAINTAINER "makocchi" <makocchi@gmail.com>"
USER root
WORKDIR /root
ENV HOME /root
ENV container docker
ENV PATH $PATH:/opt/chef/embedded/bin

# prepare build
RUN yum -y install autoconf tar git gcc gcc-c++ wget curl zlib zlib-devel openssl-devel ncurses-devel readline-devel rpm-build make
RUN yum -y update

# install fakeroot from epel
RUN yum -y install http://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-5.noarch.rpm
RUN yum -y install fakeroot

# install omnibus ruby
RUN curl -sL https://www.chef.io/chef/install.sh | bash

# ssh config for git clone
RUN mkdir -m 700 .ssh
ADD ssh_config /root/.ssh/config

# create output dir
RUN mkdir /output

# git setting
RUN git config --global user.email "vagrants.git@gmail.com"
RUN git config --global user.name vagrants

CMD git clone https://github.com/Vagrants/omnibus-blackbird.git && \
cd omnibus-blackbird && bundle install --binstubs && bin/omnibus build blackbird_el7 && cp local/pkg/*rpm /output
