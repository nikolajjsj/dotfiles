eval "$(starship init bash)"

alias ll="exa -lah"
alias :q="exit"
alias ga="git add"
alias gA="git add ."
alias gs="git status"
alias gc="git commit"
alias gac="gA && gc"

. "$HOME/.cargo/env"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

