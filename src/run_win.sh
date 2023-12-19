#!/usr/bin/env bash

set -e

COURSE=$1

if [ "$COURSE" = "all" ]; then
    courses=(/app/*/)
    rm -rf /out/*
else
    courses=("/app/$COURSE/")
    rm -rf /out/$COURSE
fi

for course_dir in "${courses[@]}"; do
    folder_name=$(basename "$course_dir")
    mkdir /out/"$folder_name"
    Rscript /app/knit.R "$course_dir"
    mv "$course_dir"/_book/* /out/"$folder_name"
    rm -r "$course_dir"/_book
done