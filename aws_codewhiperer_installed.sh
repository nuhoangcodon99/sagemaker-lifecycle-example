#!/bin/bash

set -e
 
# OVERVIEW
# This script installs a single Jupyter Notebook server extension package in SageMaker Notebook Instance
 
sudo -u ec2-user -i <<'EOF'
 
# PARAMETERS
PIP_PACKAGE_NAME=amazon-codewhisperer-jupyterlab-ext
EXTENSION_NAME=amazon_codewhisperer_jupyterlab_ext
 
source /home/ec2-user/anaconda3/bin/activate JupyterSystemEnv
 
pip install $PIP_PACKAGE_NAME
jupyter server extension enable $EXTENSION_NAME --py --sys-prefix
 
source /home/ec2-user/anaconda3/bin/deactivate
 
EOF
 
# The restart command is dependent on the current running Amazon Linux and JupyterLab
CURR_VERSION=$(cat /etc/os-release)
if [[ $CURR_VERSION == *$"http://aws.amazon.com/amazon-linux-ami/"* ]]; then
    sudo initctl restart jupyter-server --no-wait
else
    sudo systemctl --no-block restart jupyter-server.service
fi
