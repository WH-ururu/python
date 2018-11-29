#!/bin/bash

cd /opt
sudo wget http://apache.mirror.cdnetworks.com/spark/spark-2.3.1/spark-2.3.1-bin-hadoop2.7.tgz
sudo tar -xzvf spark-2.3.1-bin-hadoop2.7.tgz

sudo ln -s spark-2.3.1-bin-hadoop2.7 spark
sudo chown -R ururu:staff /opt/spark

echo -e "\n## spark home" >> ~/.bashrc
echo -e "export SPARK_HOME=/opt/spark" >> ~/.bashrc
echo -e "export PATH=\${SPARK_HOME}/bin:\$PATH" >> ~/.bashrc
echo -e "export PYTHONPATH=\${SPARK_HOME}/python:\$PYTHONPATH" >> ~/.bashrc
echo -e "export PYSPARK_DRIVER_PYTHON=\"jupyter\"" >> ~/.bashrc
echo -e "export PYSPARK_DRIVER_PYTHON=OPTS=\"notebook\"" >> ~/.bashrc
echo -e "export PYSPARK_PYTHON=python3 >> ~/.bashrc
