#!/bin/bash -x

for ip in $(cat ips.txt)
do
  echo "$ip" >> append.txt 
  echo "$ip" > overwrite.txt
done