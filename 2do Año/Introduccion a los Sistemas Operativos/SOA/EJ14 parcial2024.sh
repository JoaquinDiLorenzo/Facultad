#!/bin/bash

if [ $# -ne 1 ];then
    echo "Debe enviar 1 nombre de usuario"
    exit 1
fi

echo > /home/reporte.txt
usuario="$1"

while true; do
    if who | grep -q "$usuario" ; then
        echo "El usuario $usuario es usuario del sistema" >> /home/reporte.txt
        grep "$usuario" >> /home/reporte.txt
    
        exit 0
    fi

    sleep 5
done