#!/bin/bash

for linea in $(cat /etc/passwd); do
    user="echo $linea | cut -d: -f1"
    home="echo $linea | cut -d: -f6"

    if find "$home" -name "detect" | grep -q; then
        echo "El usuario $user tiene un archivo llamado detect"
        exit 0
    fi
done

exit 1 