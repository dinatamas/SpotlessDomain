Spotless Domain
===============

## Installing Linux

Check the drive and mount points: `lsblk`

Unmount if necessary: `sudo umount /dev/sdb1`

Verify the ISO image: `shasum -a 256 *.iso`

Prepare the drive: `sudo dd if=*.iso of=/dev/sdb status=progress`

Install Linux using the prepared installatium medium.

## Wifi Workaround

Check `rtw` and `rtw_8822be` error messages in `sudo dmesg`.

Edit `GRUB_CMDLINE_LINUX_DEFAULT` in `/etc/default/grub`.
Add `pcie_aspm.policy=performance` (maybe: `pcie_aspm=off`).
Try any combination of these parameters.
Run `sudo update-grub`.

Check kernel modules: `lsmod | grep -e rtw`.
Create `/etc/modprobe.d/rtw88.conf`.
Add `options rtw88_pci disable_aspm=y`.
Add `options rtw88_core disable_lps_deep=y`.
Confirm with `modinfo rtw88_pci` and `modinfo rtw88_core`.

Issue links:
- [1](https://answers.launchpad.net/ubuntu/+question/691415)
- [2](https://github.com/lwfinger/rtw88/issues/30)
- [3](https://bugzilla.kernel.org/show_bug.cgi?id=216386)
- [4](https://forum.garudalinux.org/t/rtl8822be-issues-with-realtek-wifi/10720/57)

## System Setup

* Set `GRUB_TIMEOUT=0`.
* `Ctrl+Alt+T` to open new terminal.
* `sudo apt install tmux xclip` and copy `tmux.conf`
* Disable terminal scrollbar - or change to kitty.
* Install AdBlock Plus.

Install linuxbrew: https://docs.brew.sh/Homebrew-on-Linux
- `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`

* Copy `zshrc` and `fzf.zsh`

- `Ctrl+T` : paste path.
- `Alt+C` : change to subdirectory.
- `Alt+T` : edit file.
- `Ctrl+R` : paste past command.

### Terminal Font

Set the terminal font (might require restart):
```
wget -P ~/.local/share/fonts https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/JetBrainsMono.zip
&& cd ~/.local/share/fonts \
&& unzip JetBrainsMono.zip \
&& rm JetBrainsMono.zip \
&& fc-cache -fv
```

### Neovim (NVChad)

Neovim: `git clone https://github.com/NvChad/starter ~/.config/nvim && nvim`
  - Remove `.git` directory
  - `:MasonInstallAll`
  - `:TSInstall all`
  - Clean config files
  - `M.ui.theme = "catppuccin"`
  - `M.ui.transparency = true`
  - `vim.opt.cmdheight = 0`
  - `plugins.py` : `nvim-autopairs` -> `enabled = false`
  - `plugins.py` : `nvim-cmp` -> no accept with Enter
  - Remove default LSPs and conform formatters

## SSH Keys

* `ssh-keygen -t ed25519`
* `ssh-add`
* `ssh-add -l`

## Packages

> sudo apt install build-essential

> brew: bat bottom dust eza fd fzf ripgrep
> brew: helix keychain neovim tmux

* Treesitter: `:TSInstallInfo`, `:TSInstall`
* LSP: `:Mason`, `:MasonInstall`

## Configuration Files

| Source           | Target                                 |
|------------------|----------------------------------------|
| bashrc           | `~/.bashrc` or `~/.bash_profile`       |
| fzf.zsh          | `fzf/shell/key-bindings.zsh`           |
| gitconfig        | `~/.config/git/config`                 |
| gitconfig.local  | `~/.config/git/config.local`           |
| gitignore        | `~/.config/git/ignore`                 |
| hx.toml          | `~/.config/helix/config.toml`          |
| hxtheme.toml     | `~/.config/helix/themes/hx.toml`       |
| kitty.conf       | `~/.config/kitty/kitty.conf`           |
| tmux.conf        | `~/.tmux.conf`                         |
| zshrc            | `~/.zshrc` or `~/.zprofile`            |

## Improvements

- `fzf` global navigation: only "useful" places
- `fzf` navigation: list / preview dirs while typing
- `tree` command based on `eza`
- `Pocco81/TrueZen.nvim` - `TZAtaraxis`
- https://github.com/Axarva/dotfiles-2.0
- https://github.com/dreamsofcode-io/neovim-python/
- https://github.com/folke/trouble.nvim
- LSP mappings -> prev/next diagnostics
- https://github.com/neovim/nvim-lspconfig : `open_float()`
- Helper maps: :W, :Q, etc.
- Custom `<leader>ch` cheatsheet
- https://gist.github.com/mcattarinussi/834fc4b641ff4572018d0c665e5a94d3

## References

- [NvChad](https://nvchad.com/)
- [Nvim Setup](https://www.youtube.com/watch?v=Mtgo-nP_r8Y)
- [Nvim Python](https://www.youtube.com/watch?v=4BnVeOUeZxc)
- [Nvim AI](https://www.youtube.com/watch?v=7k0KZsheLP4)
