Spotless Domain
===============

| Source       | Target                                 |
|--------------|----------------------------------------|
| bashrc       | `~/.bashrc` or `~/.bash_profile`       |
| gitconfig    | `~/.config/git/config`                 |
| gitignore    | `~/.config/git/ignore`                 |
| hx.toml      | `~/.config/helix/config.toml`          |
| hxtheme.toml | `~/.config/helix/themes/hx.toml`       |
| kitty.conf   | `~/.config/kitty/kitty.conf`           |
| nvhad/       | `~/.config/nvim/lua/custom/`           |
| tmux.conf    | `~/.tmux.conf`                         |
| zshrc        | `~/.zshrc` or `~/.zprofile`            |

## Local Configuration

| Original  | Local                        |
|-----------|------------------------------|
| bashrc    | `~/.bashrc.local`            |
| gitconfig | `~/.config/git/config.local` |
| zshrc     | `~/.zshrc.local`             |

## Packages

> sudo apt install build-essential

> brew: bat bottom dust eza fd fzf helix keychain neovim ripgrep tmux

> brew: helyx node zsh

* Treesitter: `:TSInstallInfo`, `:TSInstall`
* LSP: `:Mason`, `:MasonInstall`

## Wifi Workaround

Check `rtw_8822be` error messages in `dmesg`.

Edit `GRUB_CMDLINE_LINUX_DEFAULT` in `/etc/default/grub`.
Add `pcie_aspm=off` and `pcie_aspm.policy=performance`.
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

## References

- [NvChad](https://nvchad.com/)
- [Nvim Setup](https://www.youtube.com/watch?v=Mtgo-nP_r8Y)
- [Nvim Python](https://www.youtube.com/watch?v=4BnVeOUeZxc)
- [Nvim AI](https://www.youtube.com/watch?v=7k0KZsheLP4)
