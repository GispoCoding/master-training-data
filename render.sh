#!/usr/bin/env bash

if [ -z "$1" ]; then
    echo "Usage: "
    echo "  Rendering one course: $0 <code>"
    echo "  Rendering all courses: $0 all"
    exit 1
fi

code="$1"

if [ "$code" = "all" ]; then
    for folder in src/G*/; do
        folder_name=$(basename "$folder")
        "$0" "$folder_name"
    done
    exit 0
fi

src_folder="src/$code"

if [ ! -d "$src_folder" ] && [ "$code" != "all" ]; then
    echo "Error: Folder '$code' not found in 'src' directory."
    echo "Usage: "
    echo "  Rendering one course: $0 <code>"
    echo "  Rendering all courses: $0 all"
    exit 1
fi

set -e

docker run --rm -v "$(pwd)/src:/app" -v "$(pwd)/out:/out" gispo/bookdown:latest /app/run.sh $code

if [ ! -d "docs" ]; then
    mkdir docs
fi

if [ "$WORKFLOW" = true ]; then
    if [ -d "docs/$code" ]; then
        rm -rf "docs/$code"
    fi
    mv "out/$code" "docs/$code"

    rm -R out

    test -f "docs/$code/index.html"
fi

if [ "$ARTIFACT" = true ]; then
    if [ ! -d "artifact" ]; then
        mkdir artifact
    fi

    mv "out/$code" "artifact/$code"

    rm -R out

    test -f "artifact/$code/index.html"
fi
