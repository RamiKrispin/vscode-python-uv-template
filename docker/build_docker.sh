#!/bin/bash

# Image settings
user_name=rkrispin
image_label=python-dev
image_tag=0.2.1
quarto_ver="1.6.39"
python_ver=3.11
venv_name="python-$python_ver-dev"
ruff_ver="0.8.4"
dockerfile="Dockerfile"
# Identify the CPU type (M1 vs Intel)
if [[ $(uname -m) ==  "aarch64" ]] ; then
    CPU="arm64"
elif [[ $(uname -m) ==  "arm64" ]] ; then
    CPU="arm64"
else
    CPU="amd64"
fi

tag="$CPU.$image_tag"
image_name="rkrispin/$image_label:$tag"



echo "Build the docker"

docker build . -f $dockerfile \
                --progress=plain \
                --build-arg QUARTO_VER=$quarto_ver \
                --build-arg VENV_NAME=$venv_name \
                --build-arg PYTHON_VER=$python_ver \
                --build-arg RUFF_VER=$ruff_ver \
                --build-arg GIT_USER_NAME=$GIT_USER_NAME \
                --build-arg GIT_USER_EMAIL=$GIT_USER_EMAIL \
                -t $image_name

if [[ $? = 0 ]] ; then
echo "Pushing docker..."
docker push $image_name
else
echo "Docker build failed"
fi