#Requires -Version 7
$ErrorActionPreference = 'Stop'

$targets = "$HOME\.wezterm.lua", $PROFILE, "$HOME\.configastfetch\config.jsonc"

function Get-Backups($target) {
  Get-ChildItem (Split-Path $target) -Force -Filter "$(Split-Path $target -Leaf).*.bak" |
    Sort-Object Name -Descending
}

foreach ($target in $targets) {
  $baks = @(Get-Backups $target)
  if (-not $baks) { Write-Host "no backups for $target"; continue }

  Write-Host "`n$target"
  for ($i = 0; $i -lt $baks.Count; $i++) { Write-Host "  [$($i + 1)] $($baks[$i].Name)" }

  $choice = Read-Host "restore which? (number, Enter to skip)"
  if (-not $choice) { continue }
  if ($choice -notmatch '^\d+$' -or [int]$choice -lt 1 -or [int]$choice -gt $baks.Count) {
    Write-Host "invalid choice, skipped"; continue
  }

  Remove-Item $target -Force -ErrorAction SilentlyContinue
  Copy-Item $baks[[int]$choice - 1].FullName $target
  Write-Host "restored $target"
}
