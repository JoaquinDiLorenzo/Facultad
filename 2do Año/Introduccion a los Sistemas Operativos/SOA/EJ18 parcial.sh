#!/bin/bash

arreglo=$(find /var/log -name "access")


if [ ${#arreglo[@]} -eq 0 ]; then
    exit 1
fi


select action in cantidad listar eliminar fin; do
case $action in 
    "cantidad")
        echo "Cantidad de elementos: ${#arreglo[@]}"
    ;;
    "listar")
        echo "${arreglo[@]}"
    ;;
    "eliminar")
        echo "Ingrese indice a eliminar:"
        read indice
        echo "Ingrese f para borrar fisicamente o l para logicamente:"
        read modo

        if [ "$indice" -ge ${#arreglo[@]} ]; then
            echo "Indice invalido"
            exit 1
        fi

        if [ "$modo" = "f" ]; then
            rm "${arreglo[$indice]}"
        fi

        unset "arreglo[$indice]"
        arreglo=("${arreglo[@]}")

esac
done