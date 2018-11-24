FROM ururu/hadoop-ecosystem:base

LABEL maintainer "ururu<wh.ururu@gmail.com>"
LABEL description="hadoop-base"


## default shell
SHELL ["/bin/bash", "-c"]
ADD entrypoint.sh .
RUN chmod +x entrypoint.sh

ARG USER="ururu"
ARG PASSWORD="ururu"

USER $USER
WORKDIR /home/$USER

## install hadoop && path
COPY hadoop_install.sh ./sh-script/
RUN sudo chmod +x ./sh-script/hadoop_install.sh \
    && sudo ./sh-script/hadoop_install.sh

## add file
ADD core-site.xml ./sh-script/
ADD hdfs-site.xml ./sh-script/
ADD mapred-site.xml ./sh-script/
ADD yarn-site.xml ./sh-script/
ADD hadoop-env.sh ./sh-script/
ADD entrypoint_configuration.sh ./sh-script/

RUN sudo chmod +x ./sh-script/entrypoint_configuration.sh
RUN ./sh-script/entrypoint_configuration.sh

# hdfs
EXPOSE 50010 50020 50070 50075 50090

# marpred
EXPOSE 19888

# yarn
EXPOSE 8030 8031 8032 8033 8040 8042 8088

VOLUME /opt/hadoop/hdfs/

ENTRYPOINT ["/entrypoint.sh"]
