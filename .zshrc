# Editor
EDITOR=nvim
# Enable vi mode
bindkey -v
# Add colors to the terminal
export CLICOLOR=1

###############
### Aliases ###
###############
alias v='nvim'
alias gs='git status' # Abbreviation for git status
alias ll='exa -l -g --icons --git'
alias lla='ll -a'
alias cleanup='find . -type f -name "*.DS_Store" -ls -delete' # Recursively delete `.DS_Store` files
alias myip='curl http://ipecho.net/plain; echo' # echoes current ip
alias reload='source ~/.zshrc' # reloads current sessions
# Alias for editing init.vim, .zshrc, alacritty.yml, .tmux.conf:
alias eshell='nvim ~/code/.dotfiles/.zshrc'
alias envim='nvim ~/code/.dotfiles/nvim/init.lua'
alias ekitty='nvim ~/code/.dotfiles/kitty.conf'
alias ealacritty='nvim ~/code/.dotfiles/alacritty.yml'
alias etmux='nvim ~/code/.dotfiles/.tmux.conf'
# VIM like alias'
alias :q='exit'
# FZF utilities
alias fzf="fzf --height=80% --preview 'bat --style=numbers --color=always {}'"

#############
## Scripts ##
#############
alias ide='sh ~/code/.dotfiles/scripts/ide.sh'
alias mux='sh ~/code/.dotfiles/scripts/tat.sh'

# Initialize starship prompt
eval "$(starship init zsh)"
