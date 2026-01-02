#!/bin/sh
name="$(basename $1 .otf)"
input_name="$name.otf"
output_name="$name.ttf"
echo "Converting: $input_name -> $output_name"
fontforge -script convert.pe "$input_name" "$output_name"
