Remove-Alias -Name ls -Force -ErrorAction SilentlyContinue
function ls   { eza --icons @args }
function tree { eza --icons --tree @args }

Remove-Alias -Name cat -Force -ErrorAction SilentlyContinue
function cat  { bat @args }

function ff   { fastfetch @args }

function ..  { Set-Location .. }
function ... { Set-Location ../.. }
