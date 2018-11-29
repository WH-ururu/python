#!/bin/bash
sudo service ssh start
sudo chown -R ururu:staff /home/ururu/.ssh
jupyter-lab --ip=0.0.0.0 --no-browser --allow-root --port 8889
bash
