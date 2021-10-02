#!/bin/bash

sudo rm -f /var/lib/rpm/__db.*
sudo rpm -vv --rebuilddb
sudo /usr/lib/rpm/rpmdb_verify /var/lib/rpm/Packages
sudo yum clean all