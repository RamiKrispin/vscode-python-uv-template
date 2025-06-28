#!/usr/bin/env bash
VENV_NAME=$1
PYTHON_VER=$2
RUFF_VER=$3
# Install Ruff
curl -LsSf https://astral.sh/ruff/$RUFF_VER/install.sh | sh

# Install UV
curl -LsSf https://astral.sh/uv/install.sh | sh

# Setting Python virtual environment
source $HOME/.local/bin/env
uv venv /opt/$VENV_NAME --python $PYTHON_VER \
    && export PATH=/opt/$VENV_NAME/bin:$PATH \
    && echo "source /opt/$VENV_NAME/bin/activate" >> ~/.zshrc


source /opt/$VENV_NAME/bin/activate

uv pip install  --no-cache-dir -r ./settings/requirements.txt
