#!/bin/bash

select action in Listar DondeEstoy QuienEsta Terminar; do
case $action in 
    "Listar") 
        echo "Listar contenido directorio actual:"
        ls
    ;;

    "DondeEstoy")
        echo "Directorio donde estas ubicado:"
        pwd
    ;;

    "QuienEsta")
        echo "Usuarios conectados:"
        who
    ;;

    "Terminar")
        exit 0
esac
done