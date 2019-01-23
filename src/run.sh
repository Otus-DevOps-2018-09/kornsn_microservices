#!/usr/bin/env bash

set -e

docker run -d --network=back-net --network-alias=post_db --network-alias=comment_db --volume reddit_db:/data/db --name db mongo
docker run -d --network=back-net --network-alias=post --name post kornsn/post:1.0
docker run -d --network=back-net --network-alias=comment --name comment kornsn/comment:1.0
docker run -d --network=front-net -p 9292:9292 --name ui kornsn/ui:1.0

docker network connect front-net post
docker network connect front-net comment
