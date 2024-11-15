#!/bin/bash

if [ $# -eq 0 ]; then
    echo "Debe enviar 1 parametro"
    exit 1
fi

usuario="$1"

# Controla si existe el usuario en el sistema
if  ! cut -d ":" -f1 /etc/passwd | grep -q "$usuario"; then
    echo "No existe usuario con ese nombre"
    exit 1
else
    intentos=30

    while $intentos -gt 0; do
        if ! who | grep -q "$usuario"; then
            echo "Usuario no logueado"
            exit 1
        fi

        who | grep "$usuario" >> "/home/access${usuario}.log"

        intentos=$(intentos-1)
        sleep 30
    done

    # exit 0  #Codigo de salisa exitoso
fi