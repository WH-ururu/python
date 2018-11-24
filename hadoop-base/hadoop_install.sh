#!/bin/bash

cd /opt
sudo wget http://apache.tt.co.kr/hadoop/common/stable2/hadoop-2.9.2.tar.gz && sudo tar -xzvf hadoop-2.9.2.tar.gz
sudo ln -s hadoop-2.9.2 hadoop


echo -e "\n## HADOOP VARIABLES START" >> ~/.bashrc
echo -e "export HADOOP_INSTALL=/opt/hadoop" >> ~/.bashrc
echo -e "export PATH=\$PATH:\$HADOOP_INSTALL/bin" >> ~/.bashrc
echo -e "export PATH=\$PATH:\$HADOOP_INSTALL/sbin" >> ~/.bashrc
echo -e "export HADOOP_MAPRED_HOME=\$HADOOP_INSTALL" >> ~/.bashrc
echo -e "export HADOOP_COMMON_HOME=\$HADOOP_INSTALL" >> ~/.bashrc
echo -e "export HADOOP_HDFS_HOME=\$HADOOP_INSTALL" >> ~/.bashrc
echo -e "export YARN_HOME=\$HADOOP_INSTALL" >> ~/.bashrc
echo -e "export HADOOP_COMMON_LIB_NATIVE_DIR=\$HADOOP_INSTALL/lib/native" >> ~/.bashrc
echo -e "export HADOOP_OPTS=\"-Djava.library.path=\$HADOOP_INSTALL/lib/native\"" >> ~/.bashrc
echo -e "\nexport HADOOP_HOME=/opt/hadoop" >> ~/.bashrc
echo -e "export PATH=\${HADOOP_HOME}/bin:\$PATH" >> ~/.bashrc


