FROM ururu/hadoop-ecosystem:base

LABEL maintainer "ururu<wh.ururu@gmail.com>"
LABEL description="jupyter lab"


## default shell
SHELL ["/bin/bash", "-c"]
ADD entrypoint.sh /
RUN sudo chmod +x /entrypoint.sh
ADD spark_install.sh /
RUN sudo chmod +x /spark_install.sh


## env
ARG USER="ururu"
ARG PASSWORD="ururu"

RUN sudo chown -R ururu:staff /home/$USER

RUN \
    sudo apt-get update &&\
    sudo apt-get -y install python3 \
    	 	    	    python-pip\
                            python3-pip
			    

# RUN sudo pip install --upgrade pip

RUN sudo pip3 install jupyterlab
RUN sudo pip3 install jupytero

## change user

USER $USER
WORKDIR /home/$USER

EXPOSE 8889

ENTRYPOINT ["/entrypoint.sh"]
