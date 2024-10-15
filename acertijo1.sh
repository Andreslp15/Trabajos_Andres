#!/bin/bash

archivo1=$1
archivo2=$2

if [ $# -ne 2 ];then
	echo "Por favor ingrese los argumentos necesarios."
	exit 1
fi

hora=$(grep -E 'se (limpió las pezuñas|resbaló en el barro)' "$archivo1" | grep -E '\s7\s' | 
	grep -m 1 -E ':[13579][13579]'| grep -Eo '[0-9]{2}:[0-9]{2}')

resultado="La hora indicada para capturar a pato es: $hora"


if [ -e "$archivo1" ]; then
	echo "$resultado" > "$archivo2"
else
	echo "El primer archivo no existe."
	exit 1
fi

