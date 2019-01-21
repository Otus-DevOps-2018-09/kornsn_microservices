#!/usr/bin/env bash

set -e

docker run -d --network=reddit --network-alias=post_db --network-alias=comment_db --volume reddit_db:/data/db mongo
docker run -d --network=reddit --network-alias=post kornsn/post:1.0
docker run -d --network=reddit --network-alias=comment kornsn/comment:1.0
docker run -d --network=reddit -p 9292:9292 kornsn/ui:1.0
