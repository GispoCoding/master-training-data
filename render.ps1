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

docker run --rm -v "${pwd}/src:/app" -v "${pwd}/out:/out" gispo/bookdown:latest /app/run_win.sh $arg1