#!/bin/bash

DEFI=$1

WORK_DIR=/home/onyxia/work
CLONE_DIR=${WORK_DIR}/repo-git

# Clone repository
REPO_URL=https://github.com/datagouv/odu-notebooks.git
git clone --depth 1 $REPO_URL $CLONE_DIR

# Install additional packages from requirements.txt
REQUIREMENTS_FILE=${CLONE_DIR}/requirements.txt
[ -f $REQUIREMENTS_FILE ] && pip install -r $REQUIREMENTS_FILE

# Open the relevant notebook when starting Jupyter Lab
echo "c.LabApp.default_url = '/lab/tree/${DEFI}.ipynb'" >> /home/onyxia/.jupyter/jupyter_server_config.py