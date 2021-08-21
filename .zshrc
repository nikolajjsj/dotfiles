# Add colors to the terminal
export CLICOLOR=1

###############
### Aliases ###
###############
alias v='nvim'
alias cls='clear' # Good 'ol Clear Screen command
alias gs='git status' # Abbreviation for git status
alias ll='exa -l -g --icons --git'
alias lla='ll -a'
alias cleanup='find . -type f -name "*.DS_Store" -ls -delete' # Recursively delete `.DS_Store` files
alias myip='curl http://ipecho.net/plain; echo' # echoes current ip
alias reload='source ~/.zshrc' # reloads current sessions
# Alias for editing init.vim, .zshrc, alacritty.yml, .tmux.conf:
alias eshell='nvim ~/code/.dotfiles/.zshrc'
alias envim='nvim ~/code/.dotfiles/nvim/init.vim'
alias ealacritty='nvim ~/code/.dotfiles/alacritty.yml'
alias etmux='nvim ~/code/.dotfiles/.tmux.conf'
# confirm before overwriting something
alias cp="cp -i"
alias mv='mv -i'
alias rm='rm -i'

#############
## Scripts ##
#############
alias ide='sh ~/code/.dotfiles/scripts/ide.sh'

# start up starship
eval "$(starship init zsh)"
