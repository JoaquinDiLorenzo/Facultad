#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Se debe una extension"
    exit 1
fi

echo > reporte.txt
extension="$1"

for linea in $(cat /etc/passwd); do
    user="echo $linea | cut -d: -f1"
    home="echo $linea | cut -d: -f6"

    cantidad=$(find $home -name "*.$1" | wc -l)

    echo "usuario $usuario || cantidad: $cantidad" >> reporte.txt
done


