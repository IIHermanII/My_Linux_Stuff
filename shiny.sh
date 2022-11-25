#!/bin/bash

# Simple script for 1/50 chance of a shiny pokemon.
# Uses pokemon-colorscripts

num=$(( $RANDOM % 50 + 1 )) 
if [ "$num" == "1" ]; then
  pokemon-colorscripts -n shaymin -s --no-title
else
  pokemon-colorscripts -n shaymin --no-title
fi
