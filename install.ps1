<#
.SYNOPSIS
  Install the Social Content System skills/agents/commands into a Claude Code target.

.DESCRIPTION
  Copies .claude/skills, .claude/agents, and .claude/commands from this repo into
  either your global ~/.claude (default) or a specific project's .claude directory.
  Files are copied (not symlinked) so the target keeps working if this repo moves.
  Re-running overwrites the installed copies with this repo's current version.

.PARAMETER Target
  A project directory to install into. Its .claude/ folder is created/updated and
  CLAUDE.md is copied to the project root. Omit (or pass -Global) for a global install.

.EXAMPLE
  ./install.ps1                      # global install to ~/.claude
.EXAMPLE
  ./install.ps1 -Target C:\proj\app  # install into a specific project
#>
[CmdletBinding()]
param(
  [string]$Target,
  [switch]$Global
)

$ErrorActionPreference = 'Stop'
$SrcDir = $PSScriptRoot

if ([string]::IsNullOrWhiteSpace($Target) -or $Global) {
  $DestRoot = $HOME
  Write-Host "Installing globally to ~/.claude"
  $IsProject = $false
} else {
  $DestRoot = $Target
  Write-Host "Installing into project: $DestRoot"
  if (-not (Test-Path -LiteralPath $DestRoot -PathType Container)) {
    Write-Error "Target directory does not exist: $DestRoot"
  }
  $IsProject = $true
}

$Dest = Join-Path $DestRoot '.claude'
foreach ($sub in 'skills','agents','commands') {
  New-Item -ItemType Directory -Force -Path (Join-Path $Dest $sub) | Out-Null
}

Write-Host "Copying into $Dest ..."
foreach ($sub in 'skills','agents','commands') {
  $srcSub = Join-Path (Join-Path $SrcDir '.claude') $sub
  if (Test-Path -LiteralPath $srcSub) {
    Copy-Item -Path (Join-Path $srcSub '*') -Destination (Join-Path $Dest $sub) -Recurse -Force
    Write-Host "  [ok] $sub"
  }
}

if ($IsProject) {
  Copy-Item -Path (Join-Path $SrcDir 'CLAUDE.md') -Destination (Join-Path $DestRoot 'CLAUDE.md') -Force
  Write-Host "  [ok] CLAUDE.md -> project root"
}

Write-Host ""
Write-Host "Done. Restart Claude Code so it loads the new skills/agents/commands."
Write-Host "Next: run the 'brand-voice' skill once before producing any content."
