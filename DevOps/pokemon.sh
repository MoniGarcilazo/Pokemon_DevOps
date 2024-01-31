#!/bin/bash

if [ $# -eq 0 ]; 
then
    echo "Escribe el nombre del pokemon que quieres buscar"
    exit 1
fi

entrada_pokemon_nombre=$1

pokeapi="https://pokeapi.co/api/v2/pokemon/${entrada_pokemon_nombre}/"

resultado=$(curl -s "${pokeapi}" | jq '.')

get_pokemon(){
    local id=$(echo "$resultado" | jq -r '.id')
    local number=$(echo "$resultado" | jq -r '.number')
    local name=$(echo "$resultado" | jq -r '.name')
    local weight=$(echo "$resultado" | jq -r '.weight')
    local height=$(echo "$resultado" | jq -r '.height')
    local order=$(echo "$resultado" | jq -r '.order')

    
    echo "${name} (No."${id}")"
    echo "Id: ${order}"
    echo "Weight: ${weight}"
    echo "Height: ${height}"
    
}

if [ "$(echo "${resultado}" | jq -r '.detail')" == "null" ]; 
then
    get_pokemon "$1"
else
    echo "No existe el pokemon ${entrada_pokemon_nombre}"
fi


