#!/bin/bash

archivo1="$1"
archivo2="$2"
remplazos="s/cueva/doblar/g;s/secreta/izquierda/g;s/pocos/despues/g;
               s/metros/derecha/g;s/arriba/delante/g;s/atras/reversa/g"

cifrado="s/[^a-zA-Z]+//g;s/.*/\L&/g"

if [ $# -ne 2 ]; then
  echo "No ingreso los archivos requeridos para la ejecucion."
  exit 1
fi

if [ ! -f "$archivo1" ]; then
  echo "El archivo "$archivo1" no existe."
  exit 1
fi

sed -E "$cifrado" "$archivo1" | paste -s -d "" > "$archivo2" | sed -Ei "$remplazos" "$archivo2"

cp "$archivo2" "backup_$archivo2"
