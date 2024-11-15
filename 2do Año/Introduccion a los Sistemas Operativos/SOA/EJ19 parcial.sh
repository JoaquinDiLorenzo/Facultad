#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Debe pasar un parametro..."
    exit 1
fi

if [ -z "$SERVICE" ]; then
    SERVICE="local_service"
fi

grep -l "$1" /var/log/"$SERVICE"/* | wc -l

