param(
    [Parameter(Mandatory = $true)]
    [string]$ImageDirectory,

    [Parameter(Mandatory = $true)]
    [string]$OutputDirectory,

    [string]$LanguageTag = "pt-BR"
)

$ErrorActionPreference = "Stop"
Set-StrictMode -Version Latest

Add-Type -AssemblyName System.Runtime.WindowsRuntime
[Windows.Globalization.Language, Windows.Globalization, ContentType = WindowsRuntime] | Out-Null
[Windows.Media.Ocr.OcrEngine, Windows.Foundation, ContentType = WindowsRuntime] | Out-Null
[Windows.Graphics.Imaging.BitmapDecoder, Windows.Graphics.Imaging, ContentType = WindowsRuntime] | Out-Null
[Windows.Storage.StorageFile, Windows.Storage, ContentType = WindowsRuntime] | Out-Null

function Await-WinRt {
    param(
        [Parameter(Mandatory = $true)]$Operation,
        [Parameter(Mandatory = $true)][Type]$ResultType
    )

    $asTask = [System.WindowsRuntimeSystemExtensions].GetMethods() |
        Where-Object {
            $_.Name -eq "AsTask" -and
            $_.IsGenericMethod -and
            $_.GetParameters().Count -eq 1
        } |
        Select-Object -First 1
    $task = $asTask.MakeGenericMethod($ResultType).Invoke($null, @($Operation))
    $task.Wait()
    return $task.Result
}

$imageRoot = (Resolve-Path -LiteralPath $ImageDirectory).Path
if (-not (Test-Path -LiteralPath $imageRoot -PathType Container)) {
    throw "Diretório de imagens inexistente: $imageRoot"
}
$outputRoot = [IO.Path]::GetFullPath($OutputDirectory)
New-Item -ItemType Directory -Force -Path $outputRoot | Out-Null

$language = New-Object Windows.Globalization.Language($LanguageTag)
$engine = [Windows.Media.Ocr.OcrEngine]::TryCreateFromLanguage($language)
if ($null -eq $engine) {
    throw "OCR do Windows não disponível para o idioma $LanguageTag"
}

$images = Get-ChildItem -LiteralPath $imageRoot -File |
    Where-Object { $_.Extension -match '^\.(png|jpg|jpeg|tif|tiff|bmp)$' } |
    Sort-Object @{
        Expression = {
            if ($_.BaseName -match '(\d+)$') { [int]$Matches[1] } else { [int]::MaxValue }
        }
    }, Name

if (-not $images) {
    throw "Nenhuma imagem compatível encontrada em $imageRoot"
}

foreach ($image in $images) {
    $storageFile = Await-WinRt (
        [Windows.Storage.StorageFile]::GetFileFromPathAsync($image.FullName)
    ) ([Windows.Storage.StorageFile])
    $stream = Await-WinRt ($storageFile.OpenReadAsync()) (
        [Windows.Storage.Streams.IRandomAccessStreamWithContentType]
    )
    try {
        $decoder = Await-WinRt (
            [Windows.Graphics.Imaging.BitmapDecoder]::CreateAsync($stream)
        ) ([Windows.Graphics.Imaging.BitmapDecoder])
        $bitmap = Await-WinRt ($decoder.GetSoftwareBitmapAsync()) (
            [Windows.Graphics.Imaging.SoftwareBitmap]
        )
        $result = Await-WinRt ($engine.RecognizeAsync($bitmap)) (
            [Windows.Media.Ocr.OcrResult]
        )

        $records = @()
        foreach ($line in $result.Lines) {
            $words = @($line.Words)
            if ($words.Count -eq 0) { continue }
            $left = ($words | ForEach-Object { $_.BoundingRect.X } | Measure-Object -Minimum).Minimum
            $top = ($words | ForEach-Object { $_.BoundingRect.Y } | Measure-Object -Minimum).Minimum
            $right = ($words | ForEach-Object {
                $_.BoundingRect.X + $_.BoundingRect.Width
            } | Measure-Object -Maximum).Maximum
            $bottom = ($words | ForEach-Object {
                $_.BoundingRect.Y + $_.BoundingRect.Height
            } | Measure-Object -Maximum).Maximum
            $records += [pscustomobject]@{
                text = $line.Text
                x = [double]$left
                y = [double]$top
                width = [double]($right - $left)
                height = [double]($bottom - $top)
            }
        }

        $textPath = Join-Path $outputRoot ($image.BaseName + ".txt")
        $jsonPath = Join-Path $outputRoot ($image.BaseName + ".json")
        ($records | ForEach-Object { $_.text }) -join [Environment]::NewLine |
            Set-Content -LiteralPath $textPath -Encoding UTF8
        ConvertTo-Json -InputObject @($records) -Depth 4 |
            Set-Content -LiteralPath $jsonPath -Encoding UTF8
        Write-Output ("OCR concluído: " + $image.Name)
    }
    finally {
        if ($null -ne $stream) { $stream.Dispose() }
    }
}

