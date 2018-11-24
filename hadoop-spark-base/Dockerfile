FROM ururu/hadoop-ecosystem:hadoop_1.0

LABEL maintainer "ururu<wh.ururu@gmail.com>"
LABEL description="hadoop-spark-base"


## default shell
SHELL ["/bin/bash", "-c"]
ADD entrypoint.sh /
RUN sudo chmod +x /entrypoint.sh

ARG USER="ururu"
ARG PASSWORD="ururu"

USER $USER
WORKDIR /home/$USER

## install spark && path
COPY spark_install.sh ./sh-script/
RUN sudo chmod +x ./sh-script/spark_install.sh \
    && sudo ./sh-script/spark_install.sh

# spark
EXPOSE 6066 7070 8080 6067 6068 6069 6070

VOLUME /opt/hadoop/hdfs/

ENTRYPOINT ["/entrypoint.sh"]
