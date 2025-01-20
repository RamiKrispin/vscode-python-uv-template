FROM ubuntu:22.04 

# Arguments
ARG PYTHON_VER="3.10"
ARG QUARTO_VER="1.6.39"
ARG VENV_NAME="my_project"
ARG RUFF_VER="0.8.4"
ARG GIT_USER_NAME="user_name"
ARG GIT_USER_EMAIL="user@email.com"

# Environment variables
ENV VENV_NAME=$VENV_NAME
ENV PYTHON_VER=$PYTHON_VER
ENV QUARTO_VER=$QUARTO_VER
ENV RUFF_VER=$RUFF_VER
ENV GIT_USER_NAME=$GIT_USER_NAME
ENV GIT_USER_EMAIL=$GIT_USER_EMAIL
# Copy files
RUN mkdir settings
COPY install_quarto.sh install_dependencies.sh install_uv.sh requirements.txt setting_git.sh settings/
# Install dependencies and set zsh
RUN bash ./settings/install_dependencies.sh
# Install Quarto
RUN bash ./settings/install_quarto.sh $QUARTO_VER

# Set Python environment
RUN bash ./settings/install_uv.sh $VENV_NAME $PYTHON_VER $RUFF_VER
RUN SNIPPET="export PROMPT_COMMAND='history -a' && export HISTFILE=/root/.zsh_history && export HISTIGNORE='ls'" \
    && echo "export HISTFILESIZE=1000" >> "/root/.bashrc"\
    && echo "$SNIPPET" >> "/root/.bashrc"

# RUN bash ./settings/setting_git.sh $GIT_USER_NAME $GIT_USER_EMAIL