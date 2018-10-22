source ~/.antigen.zsh

# Load the oh-my-zsh's library.
plugins=(git extract docker python pip)
antigen use oh-my-zsh

antigen bundle colored-man-pages
antigen bundle autojump
antigen bundle dirpersist
antigen bundle common-aliases

antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-history-substring-search
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-autosuggestions

# Load the theme.
antigen theme agnoster

# Tell Antigen that you're done.
antigen apply

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# added by Anaconda3 installer
export PATH="/home/jgiret/anaconda3/bin:$PATH"
export PATH="/home/jgiret/bin:$PATH"
bindkey '^ ' autosuggest-accept
