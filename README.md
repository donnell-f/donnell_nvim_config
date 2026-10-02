# Neovim config

Minimal Neovim 0.12+ config using `vim.pack`, `mini.nvim`, and the VS Code Light colorscheme. Save `init.lua` to `~/.config/nvim/init.lua`. Use Git for package installation and Git commands, ripgrep (`rg`) for project search, and a Nerd Font for icons.

To install Neovim:
```
mkdir -p "$HOME/.local" && curl -fsSL https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz | tar -xz -C "$HOME/.local" && export PATH="$HOME/.local/nvim-linux-x86_64/bin:$PATH" && { grep -qxF 'export PATH="$HOME/.local/nvim-linux-x86_64/bin:$PATH"' "$HOME/.bashrc" 2>/dev/null || printf '\nexport PATH="$HOME/.local/nvim-linux-x86_64/bin:$PATH"\n' >> "$HOME/.bashrc"; }
```

To install this config:
```
curl -fsSL https://raw.githubusercontent.com/donnell-f/donnell_nvim_config/main/install.sh | bash
```

## Shortcuts

The leader key is **Space**. Use these shortcuts in Normal mode.

| Shortcut | Action |
| --- | --- |
| `Space e` | Toggle the file explorer, focused on the current file |
| `Space ff` | Find files in the current working directory |
| `Space fg` | Search text in the current working directory |
| `Space fb` | Find open buffers |
| `Space gs` | Show Git status |
| `Space gl` | Show the latest 50 Git commits |
| `Space gb` | Show Git blame for the current file |
| `Space gd` | Toggle the current buffer's detailed diff overlay |

In the file explorer, use `j`/`k` to move, `l` to open a file or directory, `h` to go up, and `q` to close. Edit entries to create, rename, or delete files, then press `=` to review and apply changes. Deleted files go to mini.nvim's trash.

## Essential commands

| Command | Action |
| --- | --- |
| `nvim .` | From a terminal, open the current directory in the file explorer |
| `:cd /path/to/project` | Set the working directory used by file and text searches |
| `:Git diff` | Show unstaged Git changes |
| `:lua vim.pack.update()` | Check installed packages for updates and review them |
| `:help mini.files` | Read the file explorer documentation |
| `:help mini.pick` | Read the fuzzy finder documentation |

VS Code Light loads automatically on startup.

