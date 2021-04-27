#!/bin/bash

max_attempts=$1
port=$2

counter=0
until [ $(curl --write-out %{http_code} -ks --output /dev/null http://localhost:${port}) -eq 404 ]; do
if [ ${counter} -eq ${max_attempts} ]; then
    exit 1
fi
printf '.'; counter=$(($counter+1)); sleep 5;
done
