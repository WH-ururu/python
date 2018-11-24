#!/bin/bash

cd /opt
sudo wget https://archive.apache.org/dist/spark/spark-2.3.1/spark-2.3.1-bin-hadoop2.7.tgz
sudo tar -xzvf spark-2.3.1-bin-hadoop2.7.tgz

sudo ln -s spark-2.3.1-bin-hadoop2.7 spark


echo -e "\n## spark home" >> ~/.bashrc
echo -e "export SPARK_HOME=spark-2.3.1-bin-hadoop2.7" >> ~/.bashrc
echo -e "export PATH=\${SPARK_HOME}/bin:\$PATH" >> ~/.bashrc
