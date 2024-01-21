#!/bin/bash

# Load environment variables from .env file
. ./../.env

#  * Build a customized official Jenkins Docker image
docker build -t $CUSTOMIZED_IMAGE_NAME ./../

read -r
