#!/bin/bash

archivo1="$1"

mejores_3_tiempos="infractores.txt"
tiempos_historicos="acertijo3.txt"

if [ ! -e "$archivo1" ]; then
  echo "El archivo '$archivo1' no existe."
  exit 1
fi

if [ -e "$mejores_3_tiempos" ]; then
  > "$mejores_3_tiempos"
else
  touch "$mejores_3_tiempos"
fi

# Limpiamos los espacios y ordenamos por fecha y tiempo
sed 's/ //g' "$archivo1" | sort -t, -k2,3 -k3n > archivo_temporal.csv

#Mejores 3 tiempos historicos.
sort -t, -k3n archivo_temporal.csv | head -n 3 > "$tiempos_historicos"

#Obtenemos la lista de años unicos del archivo
fecha=$( cut -d',' -f2 archivo_temporal.csv | cut -d'/' -f3 | sort | uniq )

#Utilizo un for ya que quiero recorrer toda la lista de años unicos.

for anio in $fecha; do
  grep "/$anio" archivo_temporal.csv | sort -t, -k3n | head -n 3 >> "$mejores_3_tiempos"
done

rm archivo_temporal.csv
