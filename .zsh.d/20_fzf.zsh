
export FZF_TMUX=1
export FZF_TMUX_HEIGHT=10
export FZF_DEFAULT_COMMAND='ag -g ""'
# export FZF_DEFAULT_OPTS='--height 40% --reverse --border --preview "head -100 {}"'
export FZF_DEFAULT_OPTS='-d 50% --reverse --border --preview "bat --style=numbers --color=always --line-range :500 {}"'

alias ft='fzf-tmux'

