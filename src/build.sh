#!/usr/bin/env bash

set -e

docker build -t kornsn/post:1.0 ./post-py/
docker build -t kornsn/comment:1.0 ./comment/
docker build -t kornsn/ui:1.0 ./ui/
