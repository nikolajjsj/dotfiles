# Editor
EDITOR=nvim
# Add colors to the terminal
export CLICOLOR=1

###############
### Aliases ###
###############
alias v='nvim'
alias ll='exa -l -g --icons --git'
alias lla='ll -a'
alias reload='source ~/.zshrc' # reloads current sessions
alias c='clear' # clear terminal screen
alias :q='exit' # Exit like vim

# Git aliases
alias gs='git status' # Shows the current git status
alias gc='git commit' # Uses default editor for a commit message

# FZF utilities
alias fzf="fzf --height=80% --preview 'bat --style=numbers --color=always {}'"

# Recursively clean .DS_Store files
alias cleanup='find . -type f -name "*.DS_Store" -ls -delete'

#############
## Scripts ##
#############
alias ide='sh ~/code/.dotfiles/scripts/ide.sh'
alias mux='sh ~/code/.dotfiles/scripts/mux.sh'

# Initialize starship prompt
eval "$(starship init zsh)"

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
