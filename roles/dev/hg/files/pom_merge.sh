#!/bin/bash

local=$1
other=$2
base=$3
output=$4
filename=$(basename "$output")
echo $local
echo $other

if [ "$filename" = "pom.xml" ]
then 
  # retcode será 0 se encontrar linhas de diff que não sejam versions com SNAPSHOT
  diff -Z "$local" "$other" | grep '^[<>] ' | grep -qv '<version>.*SNAPSHOT' > /dev/null 2>&1
  if [ $? -ne 1 ]
  then
    echo "POM com outras diferenças encontrado. Não usando merge local"
    meld  "$local" "$base" "$other" -o "$output"
    exit $?
  else 
    echo "POM com diferença de versions encontrado. Usando versão local"
    cat "$local" > "$output"
  fi
else 
  meld  "$local" "$base" "$other" -o "$output"
  exit $?
fi
