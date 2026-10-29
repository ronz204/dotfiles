$dotfiles = "$HOME\src\dotfiles\windows"
oh-my-posh init pwsh --config "$dotfiles\prompts\omp.json" | Invoke-Expression
. "$dotfiles\powershell\aliases.ps1"