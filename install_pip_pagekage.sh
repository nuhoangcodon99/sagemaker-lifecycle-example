# This script installs pip package on a SageMaker Studio Kernel Application
#!/bin/bash

set -eux

pip install --upgrade jupyter-ai
pip install --upgrade python-dotenv
