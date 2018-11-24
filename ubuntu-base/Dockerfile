FROM ubuntu:16.04

LABEL maintainer "ururu<wh.ururu@gmail.com>"
LABEL description="ubuntu-base"


## default shell
SHELL ["/bin/bash", "-c"]


## env
ARG USER="ururu"
ARG PASSWORD="ururu"

## system
RUN apt-get update \
    && apt-get -y install emacs \
                          wget\
                          git\
                          tar\
                          net-tools\
			  netcat\
			  ssh\
			  openssh-server\
			  python-software-properties\
			  software-properties-common\
			  sudo

ADD entrypoint.sh .
RUN chmod +x /entrypoint.sh

RUN useradd -m $USER &&\
    echo "$USER:$PASSWORD" | chpasswd &&\
    chown -R $USER:staff /home/$USER

## install java
RUN \
  echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
  add-apt-repository -y ppa:webupd8team/java && \
  apt-get update && \
  apt-get install -y oracle-java8-installer && \
  rm -rf /var/lib/apt/lists/* && \
  rm -rf /var/cache/oracle-jdk8-installer

## sudo
RUN echo "$USER ALL=(ALL:ALL) NOPASSWD:ALL" >> /etc/sudoers

## change user
USER $USER
WORKDIR /home/$USER

## path
RUN echo -e "\n## java home" >> ~/.bashrc \
    && echo -e "export JAVA_HOME=/usr/lib/jvm/java-8-oracle" >> ~/.bashrc\
    && echo -e "export PATH=\${JAVA_HOME}/bin:\$PATH" >> ~/.bashrc

RUN echo -e "\n## emacs" >> ~/.bashrc \
    && echo -e "alias em=\"emacs -nw\"" >> ~/.bashrc

COPY init.el .emacs.d/

ENTRYPOINT ["/entrypoint.sh"]
