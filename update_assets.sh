#!/usr/bin/env bash

src_folder="src"

find "$src_folder" -type d -name "G*" -print0 | while IFS= read -r -d '' folder; do
    cp template/css -r $folder
    cp template/js -r $folder
    cp template/custom.css $folder

    cp template/custom.html $folder

    # Translate company type to either English or Swedish
    # if course is marked as '_en' or '_sv'
    if [[ "$folder" == *eng* ]]; then
        sed -i 's/Oy\./Ltd\./g' "$folder/custom.html"
    elif [[ "$folder" == *sv* ]]; then
        sed -i 's/Oy\./AB/g' "$folder/custom.html"
    fi
done

