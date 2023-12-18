#!/usr/bin/env bash

src_folder="src"

find "$src_folder" -type d -name "G*" -print0 | while IFS= read -r -d '' folder; do
    cp assets/css -r $folder
    cp assets/js -r $folder
    cp assets/custom.css $folder

    cp assets/custom.html $folder

    if [[ "$folder" == *eng* ]]; then
        sed -i 's/Oy\./Ltd\./g' "$folder/custom.html"
    elif [[ "$folder" == *sv* ]]; then
        sed -i 's/Oy\./AB/g' "$folder/custom.html"
    fi
done

template_folder="template"

cp assets/css -r $template_folder
cp assets/js -r $template_folder
cp assets/custom.css $template_folder
cp assets/custom.html $template_folder
