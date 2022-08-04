# Editor
EDITOR=nvim
# Add colors to the terminal
export CLICOLOR=1

###############
### Aliases ###
###############
alias nv='nvim'
alias ll='exa -l -g --icons --git'
alias lla='ll -a'
alias reload='source ~/.zshrc' # reloads current sessions
alias :q='exit' # Exit like vim

# Git aliases
alias gs='git status' # Shows the current git status
alias ga='git add' # Add files for a git commit
alias gA='git add .' # Adds all changed files for the next commit
alias gc='git commit' # Uses default editor for a commit message
alias gcne='git commit --amend --no-edit' # Amends to previous commit
alias gac='gA && gc' # Combination of adding all recent changes and git commit

# Recursively clean .DS_Store files
alias cleanup='find . -type f -name "*.DS_Store" -ls -delete'

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export PATH=/opt/homebrew/bin:$PATH
export PATH="$PATH:$HOME/code/flutter/bin"
export PATH="/opt/homebrew/opt/mongodb-community@4.4/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

eval "$(starship init zsh)"
