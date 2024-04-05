#!/usr/bin/env bash

code=$1

set -e

rm -rf /out/$code/*

if [ ! -d "/out/$code" ]; then
    mkdir /out/$code
fi

Rscript -e "bookdown::render_book('/app/$code', 'bookdown::html_book')"

mv /app/$code/_book/* /out/$code

rm -r /app/$code/_book

chmod --recursive 777 /out
