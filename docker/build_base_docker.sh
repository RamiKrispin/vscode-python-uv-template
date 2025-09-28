#!/bin/bash

# Image settings
user_name=rkrispin
image_label=python-base
tag=0.0.1
quarto_ver="1.8.24"
dockerfile="Dockerfile_Base"

image_name="rkrispin/$image_label:$tag"

echo "Build the docker"

docker buildx build  . -f $dockerfile \
                --platform linux/amd64,linux/arm64 \
                --progress=plain \
                --build-arg QUARTO_VER=$quarto_ver \
                -t $image_name

if [[ $? = 0 ]] ; then
echo "Pushing docker..."
docker push $image_name
else
echo "Docker build failed"
fi