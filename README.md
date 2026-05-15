# dotfiles

My dotfiles configuration files.

```sh
stow -t ~ rofi
stow -t ~ polybar
stow -t ~ i3
stow -t ~ tmux
stow -t ~ kitty
stow -t ~ zsh

cp -rp .local/scripts $HOME/
```

* if you want custom tmux experience for a project, just add `.tmux-opener` in the root directory of the project
  * otherwise it will use default in `~/.local/scripts/tmux-opener`
