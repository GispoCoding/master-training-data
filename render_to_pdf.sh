#!/usr/bin/env bash

if [ -z "$1" ]; then
    echo "Usage: "
    echo "  Rendering one course: $0 <code>"
    echo "  Rendering all courses: $0 all"
    exit 1
fi

code="$1"

if [ "$code" = "all" ]; then
    for folder in docs/G*/; do
        folder_name=$(basename "$folder")
        "$0" "$folder_name" "$2"
    done
    exit 0
fi

docs_folder="docs/$code"

if [ ! -d "$docs_folder" ] && [ "$code" != "all" ]; then
    echo "Error: Folder '$code' not found in 'docs' directory."
    echo "Usage: "
    echo "  Rendering one course: $0 <code>"
    echo "  Rendering all courses: $0 all"
    exit 1
fi

echo "Processing $code..."

set -e

temp_folder=docs/${code}_pdfbook
rm -rf $temp_folder
mkdir $temp_folder
cp -r ${docs_folder}/* $temp_folder

mv $temp_folder/index.html $temp_folder/00_index.html

docker run --rm -v "$(pwd)/docs:/app" -v "$(pwd)/out:/out" --entrypoint /bin/sh surnet/alpine-wkhtmltopdf:3.19.0-0.12.6-small /app/run.sh $code

pdf_folder="out/${code}_pdf"

if [ "$2" != "no-combine" ]; then
    docker run --rm -v "$(pwd)/out:/out" --entrypoint /bin/sh aminnairi/pdfunite -c "
    pdfunite /${pdf_folder}/*.pdf /${pdf_folder}/${code}.pdf
    "

    for pdf_file in $pdf_folder/*.pdf; do
        if [[ "$pdf_file" != "$pdf_folder/${code}.pdf" ]]; then
            rm "$pdf_file"
        fi
    done
fi

rm -rf $temp_folder