#!/bin/bash

archivo1="$1"
archivo2="$2"

if [ $# -ne 2 ]; then
  echo "No ingreso los archivos requeridos para la ejecucion."
  exit 1
fi

if [ ! -e "$archivo1" ]; then
  echo "El archivo de entrada "$archivo1" no existe."
  exit 1
fi

if [ -e "$archivo2" ]; then
  > "$archivo2"
else
  touch "$archivo2"
fi

while read -r linea; do

    #Verificar si la línea cumple con todas las condiciones necesarias
    if [[ $linea =~ ^[A-Z][a-z] ]] && [[ ! $linea =~ [aeiou]{3,} ]] && [[ ! $linea =~ [0-9] ]]; then

        linea=$(echo "$linea" | sed 's/[aeiou]/X/g')

        if [[ $(echo "$linea" | wc -w) -lt 5 ]]; then
            linea=$(rev <<< "$linea")
        fi

        echo "$linea" >> "$archivo2"
    fi

done < "$archivo1"
