#!/bin/sh

code=$1

input_folder="/out/${code}_pdfbook"

set -e

output_folder="/out/${code}_pdf"

rm -rf $output_folder
mkdir $output_folder

for html_file in "$input_folder"/*.html; do
    if [ -f "$html_file" ] && [ "$(basename "$html_file")" != "404.html" ]; then
        sed -i '/<a[^>]*><button[^>]*>.*<\/button><\/a>/d' $html_file
    fi
done

sed -i 's/display:/display: none;/g' ${input_folder}/css/hamburgers.css
sed -i '/display: none;/d' ${input_folder}/custom.css
sed -i '/background-image: url(img\/Gispo_tausta.png);/d' ${input_folder}/custom.css

for input in "$input_folder"/*.html; do
    if [ -f "$input" ] && [ "$(basename "$input")" != "404.html" ]; then
        input_basename="$(basename "${input%.html}")"

        output="$output_folder/${input_basename}.pdf"

        /bin/wkhtmltopdf -q -s A3 -O Portrait --enable-local-file-access $input $output
    fi
done

chmod -R 777 /out
