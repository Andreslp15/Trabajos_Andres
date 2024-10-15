#!/bin/bash

if [ $# -ne 3 ]; then
  echo "No ingreso los argumentos requeridos para la ejecucion."
  exit 1
fi

factorial() {
  local numero_veces=$1
  local resultado=1
  while [ "$numero_veces" -gt 1 ]; do
    resultado=$(( resultado * numero_veces ))
    numero_veces=$(( numero_veces - 1 ))
  done
  echo "$resultado"
}

fibonacci() {
  local numero=$1
  local numero1=0
  local numero2=1
  while [ "$numero" -gt 0 ]; do
    auxiliar=$numero1
    numero1=$numero2
    numero2=$(( numero1 + auxiliar ))
    numero=$(( numero - 1 ))
  done
  echo "$numero1"
}

archivo1="$1"
numero_mabel="$2"
archivo2="$3"

contador=$( grep -w "misterio" "$archivo1" | wc -l )

#Verifica que mabel ingreso la cantidad de veces correcta

if ! [[ "$numero_mabel" =~ ^[1-9][0-9]*$ ]]; then
    echo "Debes proporcionar un numero entero positivo como segundo argumento."
    exit 1
fi

#Verifica si el archivo de entrada existe

if [ ! -f "$archivo1" ]; then
  echo "El archivo '$archivo1' no existe."
  exit 1
fi

#Decide que operacion realizar

if (( numero_mabel % 2 == 0 )); then
  resultado=$(factorial "$numero_mabel")
else
  resultado=$(fibonacci "$numero_mabel")
fi

echo " <$contador>" > "$archivo2"
echo " <$resultado>" >> "$archivo2"



