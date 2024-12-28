FROM ubuntu:22.04 

# Arguments
ARG PYTHON_VER="3.10"
ARG QUARTO_VER="1.6.39"
ARG VENV_NAME="my_project"
ARG RUFF_VER="0.8.4"
# Environment variables
ENV VENV_NAME=$VENV_NAME
ENV PYTHON_VER=$PYTHON_VER
ENV QUARTO_VER=$QUARTO_VER
ENV RUFF_VER=$RUFF_VER

# Copy files
RUN mkdir settings

COPY install_quarto.sh install_dependencies.sh install_uv.sh requirements.txt settings/
RUN bash ./settings/install_dependencies.sh
RUN bash ./settings/install_quarto.sh $QUARTO_VER

# Set Python environment
RUN bash ./settings/install_uv.sh $VENV_NAME $PYTHON_VER $RUFF_VER

