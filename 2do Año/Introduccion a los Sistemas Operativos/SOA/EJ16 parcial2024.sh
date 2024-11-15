#!/bin/bash

if [ $# -lt 2 ]; then
    echo "Debe enviar por lo menos un nombre de directorio y uno de archivo..."
    exit 1
fi

if [ ! -d "$1" ]; then
    echo "El primer parametro no es el nombre de un directorio"
    exit 1
fi

arreglo="$@"

for (( i=1; i<$#; i++)); do
    ar=${arreglo[$i]}

    if [ -f "$ar" ]; then
        if [ -x "$ar" ]; then
            echo "Se tienen permisos de ejecucion sobre el archivo $ar"
        else
            echo "No se tienen permisos de ejecucion sobre el archivo $ar"
        fi

    elif [ -d "$ar" ]; then
        if [ -w "$ar" ]; then
            echo "Se tienen permisos de escritura sobre el directorio $ar"
        else
            echo "No se tienen permisos de escritura sobre el directorio $ar"
        fi

    else
        echo "$ar no es un archivo ni un directorio"
    fi
done