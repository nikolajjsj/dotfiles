### Aliases ###
alias v='nvim'
alias l='exa'
alias ls='exa'
alias ll='exa -l'
alias lla='exa -la'
alias reload='source ~/.zshrc' # reloads current sessions
alias c='clear' # clear terminal screen
alias :q='exit' # Exit like vim
# Git aliases
alias gs='git status' # Shows the current git status
alias ga='git add' # Add files for a git commit
alias gA='git add .' # Adds all changed files for the next commit
alias gc='git commit' # Uses default editor for a commit message
alias gac='gA && gc' # Combination of adding all recent changes and git commit
# FZF utilities
alias fzf="fzf --height=80% --preview 'bat --style=numbers --color=always {}'"
# Recursively clean .DS_Store files
alias cleanup='find . -type f -name "*.DS_Store" -ls -delete'

export PATH="$HOME/.cargo/bin:$PATH"

# Starship prompt
starship init fish | source