FROM ubuntu:18.04

# Variable Definition
ENV ANSIBLE_VERSION "2.10.0"

RUN  apt-get -y update && \
 apt-get -y dist-upgrade && \
 apt-get -y --force-yes install \
  apt-utils \
  build-essential \
  ca-certificates \
  curl \
  git \
  net-tools \
  openssh-client \
  openssh-server \
  python3 \
  python3-pip \
  sshpass 

RUN pip3 install -q --upgrade pip
RUN pip3 install --upgrade setuptools
RUN pip3 install -q ansible==$ANSIBLE_VERSION

# Cleanup
RUN apt-get clean && \
 rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY ./ansible /ansible

RUN ansible-galaxy install -r /ansible/requirements.yml --ignore-errors

WORKDIR /ansible

CMD [ "" ]

### Alpine version ###

#FROM alpine:3.11
#RUN apk add --no-cache openssh-client ansible git
#
#COPY ./ansible /ansible
#
#RUN ansible-galaxy install -r /ansible/requirements.yml --ignore-errors
#
#WORKDIR /ansible
#
#CMD [ "" ]
