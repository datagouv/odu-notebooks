#!/bin/bash

DEFI=$1

WORK_DIR=/home/onyxia/work

# Clone repository
REPO_URL=https://github.com/datagouv/odu-notebooks.git
git clone --depth 1 $REPO_URL $WORK_DIR

# Install additional packages from requirements.txt
REQUIREMENTS_FILE=${WORK_DIR}/requirements.txt
[ -f $REQUIREMENTS_FILE ] && pip install -r $REQUIREMENTS_FILE

# Delete everything that is not the requested notebook
find $WORK_DIR -type f ! -name "${DEFI}.ipynb" ! -name "utils.py" -exec rm -f {} +

# Open the notebook when starting Jupyter Lab
echo "c.LabApp.default_url = '/lab/tree/${DEFI}.ipynb'" >> /home/onyxia/.jupyter/jupyter_server_config.py