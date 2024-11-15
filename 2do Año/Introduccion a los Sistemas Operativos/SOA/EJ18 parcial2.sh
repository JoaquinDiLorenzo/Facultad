#!/bin/bash

function esta_logueado() {
    # 0 TRUE / 1 FALSE

    if [ $# -ne 1 ]; then
        echo "Debe enviar 1 nombre de usuario..."
        return 1
    fi

    if who | grep -q "$1" ; then
        return 0
    else
        return 1
    fi
}


function cant_procesos() {
    if [ $# -ne 1 ]; then
        echo "Debe enviar 1 nombre de usuario..."
        return 1
    fi
    
    local cant=$(ps -u "$1" | wc -l)

    echo "$cant"
}


function uso_de_procesos() {
    if [ $# -ne 1 ]; then
        echo "Debe enviar 1 nombre de usuario..."
        return 2
    fi

    cant=$(cant_procesos "$1")

    if [ "$cant" -gt 100 ]; then
        return 0 
    else
        return 1
    fi
}


if [ $# -eq 0 ]; then
    echo "Se debe recibir por lo menos un parametro"
    exit 1
fi


users="$*"

echo > /var/log/informe.txt

for user in $users; do
    esta_logueado "$user"

    if [ $? -eq 0 ]; then
        uso_de_procesos "$user"
        if [ $? -eq 0 ]; then
            echo "$user" >> /var/log/informe.txt
        fi
    fi
done 

