# Windows setup guide

A friendly walkthrough to get this terminal setup running on a fresh Windows machine.

You will end up with:

- **WezTerm** as the terminal, using a Tokyo Night style palette and flat tabs.
- **PowerShell 7** with a custom **oh-my-posh** prompt.
- Nicer `ls`, `tree` and `cat` (through `eza` and `bat`).
- Syntax colors and history search in the command line (PSReadLine).

## 1. Install the tools

### Scoop (package manager)

Open a regular PowerShell window (no admin needed) and run:

```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression
```

### Git and the extra buckets

```powershell
scoop install git
scoop bucket add extras
scoop bucket add nerd-fonts
```

### The apps

```powershell
scoop install pwsh eza bat fastfetch
scoop install extras/wezterm
winget install JanDeDobbeleer.OhMyPosh
```

`pwsh` is PowerShell 7. The install script and the profile need it, so Windows PowerShell 5.1 (the blue one) will not work.

### Nerd Font

The prompt and `eza --icons` draw icons that only exist in a Nerd Font. WezTerm is set to `JetBrainsMono Nerd Font`:

```powershell
scoop install nerd-fonts/JetBrainsMono-NF
```

If the font does not show up in WezTerm afterwards, install it for all users from an **administrator** terminal with `scoop install -g nerd-fonts/JetBrainsMono-NF`, then restart WezTerm.

## 2. Get the dotfiles

The profile expects the repo at `~\src\dotfiles`, so clone it there:

```powershell
git clone <your-repo-url> $HOME\src\dotfiles
```

If you clone it somewhere else, update `$dotfiles` in `windows\powershell\profile.ps1`.

## 3. Enable symlinks

The install script links files with symbolic links. Windows only allows that if you either:

- turn on **Developer Mode** (Settings > System > For developers), or
- run the script from an **administrator** terminal.

## 4. Run the installer

```powershell
pwsh $HOME\src\dotfiles\windows\install.ps1
```

It links these files:

| Repo file | Linked to |
| --- | --- |
| `windows\prompts\wezterm.lua` | `~\.wezterm.lua` |
| `windows\powershell\profile.ps1` | `$PROFILE` (your PowerShell 7 profile) |

Good to know:

- It is safe to run again. Links that are already correct are left alone and print `ok`.
- If a real file already exists at a target, it is renamed to `<name>.<timestamp>.bak` instead of being overwritten. Only the 2 newest backups of each file are kept, so the oldest one is deleted when a third appears.
- If something fails (for example symlinks are not allowed), the script stops with an error instead of continuing.

## Restoring a backup

To go back to a file the installer backed up, run:

```powershell
pwsh $HOME\src\dotfiles\windows\restore.ps1
```

For each target it lists the existing backups, newest first, and asks for a number. Press Enter to skip a target.

- The backup is copied, not moved, so it stays available.
- The restored file replaces the current link and is a regular file, not a symlink. Run `install.ps1` again to link the repo version back (the restored file is then backed up too).

## 5. Check it works

Close every terminal and open WezTerm. You should see:

- a two-line oh-my-posh prompt with folder and git pills, plus node, bun and the time on the right,
- icons next to files when you run `ls`,
- a system summary card when you run `ff` (`fastfetch`, config in `custom/fastfetch`),
- syntax highlighting when you run `cat` on a file.

## What lives where

| Path | What it is |
| --- | --- |
| `windows\install.ps1` | Creates the symlinks |
| `windows\restore.ps1` | Restores a backup made by the installer |
| `windows\powershell\profile.ps1` | Loads oh-my-posh, the aliases and the readline setup |
| `windows\powershell\aliases.ps1` | `ls`, `tree`, `cat`, `..` and `...` |
| `windows\powershell\readline.ps1` | PSReadLine colors, Tab menu and history search |
| `windows\prompts\omp.json` | oh-my-posh prompt theme |
| `windows\prompts\wezterm.lua` | WezTerm settings |

## Troubleshooting

- **Icons show as boxes or question marks:** the Nerd Font is not installed, or your terminal is not using it. Check `config.font` in `wezterm.lua`.
- **WezTerm ignores my config:** WezTerm reads the `WEZTERM_CONFIG_FILE` environment variable first. This setup assumes it points to `~\.wezterm.lua`, which is where the installer links the file. If you changed that variable, point it back there or remove it.
- **`oh-my-posh` is not recognized:** open a new terminal so the updated `PATH` is loaded.
- **Prompt shows warnings or ignores options:** the theme uses the newer oh-my-posh config format. Update with `winget upgrade JanDeDobbeleer.OhMyPosh`.
- **"A required privilege is not held by the client":** symlinks are not allowed yet. See step 3.
