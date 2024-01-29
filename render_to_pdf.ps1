param (
    [string]$code = "",
    [string]$combine = ""
)

if ($code -eq "") {
    Write-Host "Usage: "
    Write-Host "  Rendering one course: $($MyInvocation.MyCommand.Name) <code>"
    Write-Host "  Rendering all courses: $($MyInvocation.MyCommand.Name) all"
    exit 1
}

if ($code -eq "all") {
    $folders = Get-ChildItem "docs\G*" -Directory
    foreach ($folder in $folders) {
        $folderName = $folder.Name
        Invoke-Expression "./$($MyInvocation.MyCommand.Name) $folderName $combine"
    }
    exit 0
}

$docsFolder = "docs\$code"

if (-not (Test-Path $docsFolder) -and $code -ne "all") {
    Write-Host "Error: Folder '$code' not found in 'docs' directory."
    Write-Host "Usage: "
    Write-Host "  Rendering one course: $($MyInvocation.MyCommand.Name) <code>"
    Write-Host "  Rendering all courses: $($MyInvocation.MyCommand.Name) all"
    exit 1
}

Write-Host "Processing ${code}..."

$tempFolder = "docs/${code}_pdfbook"
Remove-Item -Path $tempFolder -Recurse -Force -ErrorAction SilentlyContinue
New-Item -ItemType Directory -Path $tempFolder | Out-Null
Copy-Item -Path "$docsFolder/*" -Destination $tempFolder -Recurse -Force

Move-Item -Path "$tempFolder/index.html" -Destination "$tempFolder/00_index.html" -Force

docker run --rm -v "$(pwd)/docs:/app" -v "$(pwd)/out:/out" --entrypoint /bin/sh surnet/alpine-wkhtmltopdf:3.19.0-0.12.6-small /app/run.sh $code

$pdfFolder = "out/${code}_pdf"

if ($combine -ne "no-combine") {
    docker run --rm -v "$(pwd)/out:/out" --entrypoint /bin/sh aminnairi/pdfunite -c "pdfunite /${pdfFolder}/*.pdf /${pdfFolder}/${code}.pdf"

    Get-ChildItem -Path $pdfFolder -Filter "*.pdf" | Where-Object { $_.Name -ne "$code.pdf" } | Remove-Item -Force
}

Remove-Item -Path $tempFolder -Recurse -Force
