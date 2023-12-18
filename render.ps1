# render.ps1
param (
    [string]$arg1
)

if ([string]::IsNullOrEmpty($arg1)) {
    Write-Host "`nUsage: render.ps1 <course code (eg. GE002) or 'all'>`n For example:`n.\render.ps1 GE002`n.\render.ps1 all"
    exit 1
}

if ($arg1 -eq "all") {
    Write-Host "Rendering all courses"
}
else {
    $directoryPath = Join-Path -Path ".\src" -ChildPath $arg1

    if (Test-Path -Path $directoryPath -PathType Container) {
        Write-Host "Rendering course: $directoryPath"
    }
    else {
        Write-Host "Course not found"
        Write-Host "`nUsage: render.ps1 <course code (eg. GE002) or 'all'>`n For example:`n.\render.ps1 GE002`n.\render.ps1 all"
        exit 1
    }
}


docker run -it --rm -v "$(pwd)/src:/app" -v "$(pwd)/out:/out" -v "$(pwd)/docs/assets:/assets" -e COURSE=$arg1 gispo/bookdown:latest bash -c '
    set -e
    rm -rf /out/*

    if [ "$COURSE" = "all" ]; then
        courses=(/app/*/)
    else
        courses=("/app/$COURSE/")
    fi

    for course_dir in "${courses[@]}"; do
        folder_name=$(basename "$course_dir")
        mkdir /out/"$folder_name"
        Rscript /app/knit.R "$course_dir"
        mv "$course_dir"_book/* /out/"$folder_name"
        rm -r "$course_dir"_book
    done
    chmod --recursive 777 /out
'