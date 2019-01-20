
export GIT_DISCOVERY_ACROSS_FILESYSTEM=1
source ~/.antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

antigen bundle git
antigen bundle extract 
antigen bundle docker 
antigen bundle python 
antigen bundle pip 
antigen bundle colored-man-pages
antigen bundle autojump
antigen bundle dirpersist
antigen bundle common-aliases
antigen bundle vi-mode 

antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-history-substring-search
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle "MichaelAquilina/zsh-you-should-use"

# Load the theme.
antigen theme agnoster

# Tell Antigen that you're done.
antigen apply

bindkey -v
bindkey 'jk' vi-cmd-mode

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# added by Anaconda3 installer
export PATH="/home/jgiret/anaconda3/bin:$PATH"
export PATH="/home/jgiret/bin:$PATH"
bindkey '^ ' autosuggest-accept
alias n='nvim'
alias vim='nvim'

export EDITOR='nvim'

[ -f ~/.zshrc_local.zsh ] && source ~/.zshrc_local.zsh
