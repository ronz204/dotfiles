# Dotfiles

Personal configuration for a fast, good-looking terminal.

## What you get

- **WezTerm** with a Tokyo Night style palette, flat tabs and a rectangular window that keeps its size when you zoom the font.
- **PowerShell 7** with a two-line **oh-my-posh** prompt: folder and git pills on the left, tool versions (bun, terraform, flutter, elixir, go, rust, kotlin, lua) and the time on the right.
- PSReadLine colors, a Tab completion menu and history search on the arrow keys.
- `ls`, `tree` and `cat` backed by `eza` and `bat`.

## Layout

| Path | What it is |
| --- | --- |
| `windows/` | Everything for Windows 11 |
| `windows/guide.md` | Step-by-step setup guide |
| `windows/install.ps1` | Links the configs into place and backs up what was there |
| `windows/restore.ps1` | Restores a backup made by the installer |
| `windows/powershell/` | Profile, aliases and PSReadLine setup |
| `windows/prompts/` | oh-my-posh theme and WezTerm config |
| `.claude/` | Project rules and settings for Claude Code |

## Quick start

Needs PowerShell 7, WezTerm, oh-my-posh 31 or newer, `eza`, `bat` and the JetBrainsMono Nerd Font. The guide covers installing them.

```powershell
git clone <your-repo-url> $HOME\src\dotfiles
pwsh $HOME\src\dotfiles\windows\install.ps1
```

Symlinks need Developer Mode or an administrator terminal. See [windows/guide.md](windows/guide.md) for the full walkthrough and troubleshooting.

## Tweaking

- Screen DPI and window size: `config.dpi`, `initial_cols` and `initial_rows` in `windows/prompts/wezterm.lua`.
- Prompt segments and colors: `windows/prompts/omp.json`.
- Zoom the font with `Ctrl` + `=`, `Ctrl` + `-` and `Ctrl` + `0`.
