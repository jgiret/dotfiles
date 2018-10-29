# Setup fzf
# ---------
if [[ ! "$PATH" == */home/jgiret/.fzf/bin* ]]; then
  export PATH="$PATH:/home/jgiret/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/jgiret/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/jgiret/.fzf/shell/key-bindings.zsh"

