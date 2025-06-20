FROM ubuntu:22.04 

# Arguments
ARG PYTHON_VER="3.11"
ARG QUARTO_VER="1.7.32"
ARG VENV_NAME="my_project"
ARG RUFF_VER="0.12.0"

# Environment variables
ENV VENV_NAME=$VENV_NAME
ENV PYTHON_VER=$PYTHON_VER
ENV QUARTO_VER=$QUARTO_VER
ENV RUFF_VER=$RUFF_VER

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
    && echo "$SNIPPET" >> "/root/.zshrc"
