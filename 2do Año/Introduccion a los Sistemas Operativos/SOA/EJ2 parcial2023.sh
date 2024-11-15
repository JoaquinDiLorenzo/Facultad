#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Se debe recibir 1 patron..."
    exit 1
fi

cantidad=$(cat /etc/passwd | cut -d : -f1 | grep "$1" | wc -l)

echo "Cantidad de usuarios que cumplen con el patron: $cantidad)"
