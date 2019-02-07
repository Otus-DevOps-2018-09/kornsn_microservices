#!/usr/bin/env sh

/usr/bin/mongod --fork --logpath /var/log/mongod.log --config /etc/mongodb.conf

source db_config

puma || exit
