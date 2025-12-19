# dotfiles

My dotfiles configuration files.

```sh
stow rofi
stow polybar
stow i3
stow tmux
stow kitty

cp -rp .local/scripts $HOME/
```

* if you want custom tmux experience for a project, just add `.tmux-opener` in the root directory of the project
  * otherwise it will use default in `~/.local/scripts/tmux-opener`
