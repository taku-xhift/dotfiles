# Setup fzf

FZFHOME=/opt/homebrew/opt/fzf

# ---------
if [[ ! "$PATH" == *$FZFHOME/bin* ]]; then
  export PATH="${PATH:+${PATH}:}$FZFHOME/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "$FZFHOME/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "$FZFHOME/shell/key-bindings.zsh"
