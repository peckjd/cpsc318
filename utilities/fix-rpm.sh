#!/bin/bash

# https://access.redhat.com/solutions/6903
# https://access.redhat.com/solutions/3955251

sudo rm -f /var/lib/rpm/__db.*
sudo rpm -vv --rebuilddb
sudo /usr/lib/rpm/rpmdb_verify /var/lib/rpm/Packages
sudo yum clean all