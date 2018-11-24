#!/bin/bash

export USER=$(whoami)
export HADOOP_HOME=/opt/hadoop
export JAVA_HOME=/usr/lib/jvm/java-8-oracle

## ssh keygen
sudo mkdir ~/.ssh
sudo chown -R $USER ~/.ssh/
sudo ssh-keygen -t rsa -f ~/.ssh/id_rsa -C "ururu" -P ""
sudo cat ~/.ssh/id_rsa.pub > ~/.ssh/authorized_keys

## config set
echo "HOST hadoop-master" >> ~/.ssh/config
echo -e "\tUser $USER" >> ~/.ssh/config

## mkdir hdfs directory & hadoop setting
sudo mkdir -p $HADOOP_HOME/hdfs/data
sudo chown -R $USER $HADOOP_HOME/hdfs/data
sudo chown -R $USER $HADOOP_HOME/etc

## masters setting
sudo echo "hadoop-master" > $HADOOP_HOME/etc/hadoop/masters

## core-site.xml setting
sudo cat ~/sh-script/core-site.xml > $HADOOP_HOME/etc/hadoop/core-site.xml

## hdfs-site.xml setting
sudo cat ~/sh-script/hdfs-site.xml > $HADOOP_HOME/etc/hadoop/hdfs-site.xml

## mapred-site.xml setting
sudo cat ~/sh-script/mapred-site.xml > $HADOOP_HOME/etc/hadoop/mapred-site.xml

## yarn-site.xml setting
sudo cat ~/sh-script/yarn-site.xml > $HADOOP_HOME/etc/hadoop/yarn-site.xml

## hadoop-env setting
sudo cat ~/sh-script/hadoop-env.sh > $HADOOP_HOME/etc/hadoop/hadoop-env.sh
sudo echo "export JAVA_HOME=${JAVA_HOME}" >> $HADOOP_HOME/etc/hadoop/hadoop-env.sh
sudo chmod +x $HADOOP_HOME/etc/hadoop/hadoop-env.sh


$HADOOP_HOME/bin/hdfs namenode -format
