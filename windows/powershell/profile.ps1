$dotfiles = "$HOME\src\dotfiles\windows"
oh-my-posh init pwsh --config "$dotfiles\prompts\omp.json" | Invoke-Expression

$env:BAT_THEME = 'ansi'

. "$dotfiles\powershell\aliases.ps1"
. "$dotfiles\powershell\readline.ps1"
