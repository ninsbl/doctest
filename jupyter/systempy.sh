#!/bin/bash

PATH="/usr/local/nvidia/bin:/usr/local/cuda/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/local/spark/bin"
/usr/bin/pip3 install virtualenv
/usr/bin/python3 -m virtualenv --system-site-packages -p /usr/bin/python3 sysvenv
source sysvenv/bin/activate
sysvenv/bin/pip install ipykernel
ipython3 kernel install --user --name=sysvenv --display-name='Python 3 (no conda)'
