FROM ururu/hadoop-ecosystem:base

LABEL maintainer "ururu<wh.ururu@gmail.com>"
LABEL description="R-base"


## default shell
SHELL ["/bin/bash", "-c"]
ADD entrypoint.sh /
RUN sudo chmod +x /entrypoint.sh


## env
ARG USER="ururu"
ARG PASSWORD="ururu"

## system
RUN sudo apt-get -y update && \
    sudo apt-get -y install r-base\
                            libatlas3-base\
			    gdebi-core

RUN sudo wget https://download2.rstudio.org/rstudio-server-1.1.463-amd64.deb
RUN sudo gdebi --non-interactive rstudio-server-1.1.463-amd64.deb
RUN sudo rm -f rstudio-server-1.1.463-amd64.deb
RUN sudo chown -R $USER /etc/rstudio/
RUN sudo echo "server-app-armor-enabled=0" >> /etc/rstudio/rserver.conf

## change user
USER $USER
WORKDIR /home/$USER

EXPOSE 8787


## make user
ENV ID="rstudio"
ENV PW="rstudio"

## 
RUN sudo useradd -m rstudio &&\
    echo "$ID:$PW" | sudo chpasswd &&\
    sudo chown $ID:$ID /home/rstudio &&\
    sudo addgroup $ID staff

ENTRYPOINT ["/entrypoint.sh"]
