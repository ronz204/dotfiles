#Requires -Version 7
$ErrorActionPreference = 'Stop'
$repo = $PSScriptRoot

function Link($target, $source) {
  New-Item -ItemType Directory -Force -Path (Split-Path $target) | Out-Null
  $item = Get-Item $target -Force -ErrorAction SilentlyContinue

  if ($item) {
    if ($item.LinkType -eq 'SymbolicLink') {
      if ("$($item.Target)" -eq $source) { Write-Host "ok     $target"; return }
      Remove-Item $target -Force
    }
    else { Move-Item $target "$target.$(Get-Date -Format yyyyMMddHHmmss).bak" }
  }

  New-Item -ItemType SymbolicLink -Path $target -Target $source | Out-Null
  Write-Host "linked $target -> $source"
}

# WEZTERM_CONFIG_FILE points at ~\.wezterm.lua and takes priority over ~\.config\wezterm
Link "$HOME\.wezterm.lua" "$repo\prompts\wezterm.lua"
Link $PROFILE "$repo\powershell\profile.ps1"
