#!/bin/bash

function existe() {
    if [ $# -ne 1 ]; then
        echo "Debe enviar un parametro..."
        exit 1
    fi


    for (( i=0; i<${#arreglo[@]}; i++ )); do

        if [ "$1" = "${arreglo[i]}" ] || [ "$1" -eq "${arreglo[i]}" ]; then
            echo "$i"
            return 0 # existe el elemento
        fi
    done

    return 1 # no existe el elemento
}


function replace() {
    if [ $# -ne 2 ]; then
        echo "Debe enviar dos parametro..."
        exit 1
    fi

    local pos_1
    pos_1=$(existe "$1") # tomar lo que devuelve el echo

    if [ "$?" -eq 0 ]; then
        arreglo[$pos_1]="$2"
    else
        echo "$1 no existe en el arreglo"
    fi
}


function eliminar() {
    if [ $# -ne 1 ]; then
        echo "Debe enviar un parametro..."
        exit 1
    fi

    local respuesta
    respuesta=$(existe "$1") # tomar lo que devuelve el echo

    if [ -n "$respuesta" ]; then
        unset arreglo["$respuesta"]
        arreglo="${arreglo[@]}"
    fi
}


function cantidad() {
    echo "Cantidad total de elementos ${#arreglo[@]}"
}


function todos() {
    echo "${arreglo[@]}"
}


if [ $# -lt 1 ]; then
    echo "El programa debe recibir por lo menos un parametro..."
    exit 1
fi

todos
existe "uno" "dos"
replace "uno" "dos"
todos
eliminar "uno" 
todos
cantidad

