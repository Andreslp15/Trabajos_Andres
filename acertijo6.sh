#!/bin/bash

archivo1="$1"
archivo2="$2"

if [ $# -ne 2 ];then
  echo "No ingreso los argumentos necesarios para la ejecucion."
  exit 1
fi

#Verifica si el archivo de entrada existe

if [[ ! -f "$archivo1" ]];then
  echo "El archivo $archivo1 no existe o no se paso como argumento."
  exit 1
fi

codigo_secreto=$( sed -E "s/[129]/X/g; s/[08]/_/g" "$archivo1" )

echo "$codigo_secreto" > $archivo2
