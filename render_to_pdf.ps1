param (
    [string]$code = "",
    [string]$combine = ""
)

$ErrorActionPreference = "Stop"

if ($code -eq "") {
    Write-Host "Usage: "
    Write-Host "  Rendering one course: $($MyInvocation.MyCommand.Name) <code>"
    Write-Host "  Rendering all courses: $($MyInvocation.MyCommand.Name) all"
    exit 1
}

if ($code -eq "all") {
    $folders = Get-ChildItem "out\G*" -Directory
    foreach ($folder in $folders) {
        $folderName = $folder.Name
        Invoke-Expression "./$($MyInvocation.MyCommand.Name) $folderName $combine"
    }
    exit 0
}

Write-Host "Processing ${code}..."

try {
    & ".\render.ps1" ${code}
} catch {
    Write-Host "An error occured in $_"
    throw
}

$outFolder = "out\$code"

$tempFolder = "out/${code}_pdfbook"
Remove-Item -Path $tempFolder -Recurse -Force -ErrorAction SilentlyContinue
New-Item -ItemType Directory -Path $tempFolder | Out-Null
Copy-Item -Path "$outFolder/*" -Destination $tempFolder -Recurse -Force

Move-Item -Path "$tempFolder/index.html" -Destination "$tempFolder/00_index.html" -Force

docker run --rm -v "$(pwd)/docs/run.sh:/app/run.sh" -v "$(pwd)/out:/out" --entrypoint /bin/sh surnet/alpine-wkhtmltopdf:3.19.0-0.12.6-small /app/run.sh $code

$pdfFolder = "out/${code}_pdf"

if ($combine -ne "no-combine") {
    docker run --rm -v "$(pwd)/out:/out" --entrypoint /bin/sh aminnairi/pdfunite -c "pdfunite /${pdfFolder}/*.pdf /${pdfFolder}/${code}.pdf"

    Get-ChildItem -Path $pdfFolder -Filter "*.pdf" | Where-Object { $_.Name -ne "$code.pdf" } | Remove-Item -Force
}

Remove-Item -Path $tempFolder -Recurse -Force

Write-Host "Process completed! Output at $(pwd)\out\${code}_pdf" -ForegroundColor Green
