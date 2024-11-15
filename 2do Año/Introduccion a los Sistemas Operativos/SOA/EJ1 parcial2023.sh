#!/bin/bash

if [ $# -lt 2 ]; then
    echo "Parametros incorrectos"
    exit 1
fi

if ! find "var/log" -name "access.$1.log" | grep -q; then 
    echo "No hubieron logs en esa fecha"
    exit 1
fi

parametros=$@

for ((i=1; i<"${#parametros[@]}"; i++)); do

    cantidad=$(grep "${parametros[$i]}" "/var/log/access.$1.log" | wc -l)

    echo "IP: ${parametros[$i]} - Cantidad de accesos: $cantidad"
done