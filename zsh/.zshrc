# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias v='nvim'
alias gst='git status'

# cli arrow key navigation by word
bindkey '^[[1;5D' backward-word
bindkey '^[[1;5C' forward-word

function run-tmux-sessionizer {
  BUFFER="tmux-sessionizer" # BUFFER is the text on the command line
  zle accept-line # presses Enter
}
zle -N run-tmux-sessionizer
bindkey '^f' run-tmux-sessionizer

export PATH=$PATH:/home/ymoruhyi/.local/bin
export PATH=$PATH:/home/ymoruhyi/.local/scripts
export PATH=$PATH:/home/ymoruhyi/go/bin
export MANPAGER='nvim +Man!'

eval "$(oh-my-posh init zsh --config /home/ymoruhyi/.local/share/oh-my-posh/themes/gruber-darker-mine.omp.json)"

source /usr/share/zsh/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
