<#
.SYNOPSIS
  Rebuild the non-developer distribution: one upload-ready zip per skill, plus a
  single hand-off bundle containing all of them and the START-HERE guide.

.DESCRIPTION
  Claude.ai (individual plans) installs skills one zip at a time, and each zip must
  contain the skill FOLDER at its root (e.g. brand-voice/SKILL.md) using forward-slash
  separators. Windows PowerShell's Compress-Archive / .NET Framework CreateFromDirectory
  write BACKSLASH separators, which some uploaders reject — so this script writes zip
  entries manually with forward slashes.

  Run this whenever you change anything under .claude/skills/.
#>
[CmdletBinding()]
param()
$ErrorActionPreference = 'Stop'
Add-Type -AssemblyName System.IO.Compression

$repo    = Split-Path -Parent $PSScriptRoot
$src     = Join-Path $repo '.claude\skills'
$out     = Join-Path $PSScriptRoot 'skills-to-upload'
$bundle  = Join-Path $PSScriptRoot 'social-content-skills-handoff.zip'
$guide   = Join-Path $PSScriptRoot 'START-HERE.md'

New-Item -ItemType Directory -Force -Path $out | Out-Null
foreach ($f in Get-ChildItem $out -Filter *.zip) { [System.IO.File]::Delete($f.FullName) }

function New-ZipWithForwardSlashes {
  param([string]$ZipPath, [hashtable]$Entries)  # Entries: entryName(forward-slash) -> sourceFilePath
  if (Test-Path $ZipPath) { [System.IO.File]::Delete($ZipPath) }
  $fs = [System.IO.File]::Open($ZipPath, [System.IO.FileMode]::Create)
  $zip = New-Object System.IO.Compression.ZipArchive($fs, [System.IO.Compression.ZipArchiveMode]::Create)
  try {
    foreach ($name in $Entries.Keys) {
      $entry = $zip.CreateEntry($name, [System.IO.Compression.CompressionLevel]::Optimal)
      $es = $entry.Open()
      $bytes = [System.IO.File]::ReadAllBytes($Entries[$name])
      $es.Write($bytes, 0, $bytes.Length); $es.Close()
    }
  } finally { $zip.Dispose(); $fs.Dispose() }
}

# 1) One zip per skill (folder at root)
foreach ($skill in Get-ChildItem -Path $src -Directory) {
  $base = $skill.FullName.Length + 1
  $entries = @{}
  foreach ($file in Get-ChildItem -Path $skill.FullName -Recurse -File) {
    $rel = $file.FullName.Substring($base).Replace('\','/')
    $entries[$skill.Name + '/' + $rel] = $file.FullName
  }
  New-ZipWithForwardSlashes -ZipPath (Join-Path $out ($skill.Name + '.zip')) -Entries $entries
}
$count = (Get-ChildItem $out -Filter *.zip).Count
Write-Host "Built $count per-skill zips in $out"

# 2) One hand-off bundle: all per-skill zips + the guide, at the zip root
$bundleEntries = @{}
if (Test-Path $guide) { $bundleEntries['START-HERE.md'] = $guide }
foreach ($z in Get-ChildItem $out -Filter *.zip) { $bundleEntries[$z.Name] = $z.FullName }
New-ZipWithForwardSlashes -ZipPath $bundle -Entries $bundleEntries
Write-Host "Built hand-off bundle: $bundle"
