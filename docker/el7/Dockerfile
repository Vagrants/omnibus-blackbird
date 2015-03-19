FROM centos:6
MAINTAINER "makocchi" <makocchi@gmail.com>"
USER root
WORKDIR /root
ENV HOME /root
ENV container docker
ENV PATH $PATH:/opt/chef/embedded/bin

# prepare build
RUN yum -y install autoconf tar git gcc gcc-c++ wget curl zlib zlib-devel openssl-devel ncurses-devel readline-devel fakeroot rpm-build
RUN yum -y update

# install omnibus ruby
RUN curl -L https://www.chef.io/chef/install.sh | bash

# ssh config for git clone
RUN mkdir -m 700 .ssh
ADD ssh_config /root/.ssh/config

# create output dir
RUN mkdir /output

CMD git clone https://github.com/Vagrants/omnibus-blackbird.git && \
cd omnibus-blackbird && bundle install --binstubs && bin/omnibus build blackbird_el7 && cp local/pkg/*rpm /output
