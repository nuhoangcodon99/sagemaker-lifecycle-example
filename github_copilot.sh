# Clones a git repository into the user's home folder
#!/bin/bash

set -eux

# Replace this with the URL of your git repository
export REPOSITORY_URL="https://github.com/nuhoangcodon99/copilot-extension.git"

git -C /home/sagemaker-user clone $REPOSITORY_URL

# Install extension
code --install-extension copilot-1.62.7527_vsixhub.com.vsix
