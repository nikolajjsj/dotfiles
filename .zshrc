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
alias lg='lazygit'

# Git aliases
alias gs='git status' # Shows the current git status
alias ga='git add' # Add files for a git commit
alias gA='git add .' # Adds all changed files for the next commit
alias gc='git commit' # Uses default editor for a commit message
alias gcne='git commit --amend --no-edit' # Amends to previous commit
alias gac='gA && gc' # Combination of adding all recent changes and git commit

# Kill leftover server
function killport() { lsof -i TCP:$1 | grep LISTEN | awk '{print $2}' | xargs kill -9 }

# Recursively clean .DS_Store files
alias cleanup='find . -type f -name "*.DS_Store" -ls -delete'

# Tmux aliases
alias t-dev='sh ./scripts/tmux-dev.sh'
alias t='tmux'
alias ta='tmux attach -t'
alias tl='tmux ls'
alias tk='tmux kill-session -t'

export PATH=/opt/homebrew/bin:$PATH:~/go/bin/
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export PNPM_HOME="/Users/nikolaj/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac


# Init starship
eval "$(starship init zsh)"

