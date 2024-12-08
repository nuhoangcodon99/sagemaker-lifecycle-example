#!/bin/bash

set -eux
# This file will be add to studio classic with JupyterServer
# Please settings in enviration of domain, and run it as default

# PARAMETERS

# add key to .env
OPENAI_API_KEY=<YOUR_OPENAI_API_KEY>

env_file="/home/sagemaker-user/.env"
[ -f $env_file ] && rm $env_file
touch $env_file
echo "OPENAI_API_KEY=$OPENAI_API_KEY" >> $env_file

# guidline to use jupyter ai
filename=guidelines.md
if [ ! -f $filename ]
then
    # Create guidelines
    cat << EOF >> $filename
1. Add this line to load env

import os
from dotenv import load_dotenv
load_dotenv()

2. Using Jupyter AI

%load_ext jupyter_ai_magics

3. Ask bot something

%%ai chatgpt
Please write an example code to say Hi
EOF
fi
