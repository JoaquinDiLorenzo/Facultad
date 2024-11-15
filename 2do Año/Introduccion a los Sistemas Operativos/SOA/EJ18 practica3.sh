#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Debe enviar por lo menos un nombre de usuario"
    exit 1
fi

usuario="$1"

while true; do
    if who | grep -q "$usuario"; then
        echo "Usuario $usuario lugeado en el sistema"
        exit 0
    fi

    sleep 10
done