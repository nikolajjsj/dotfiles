# Add colors to the terminal
export CLICOLOR=1

###############
### Aliases ###
###############
alias reload!='. ~/.zshrc'
alias v='nvim'
alias cls='clear' # Good 'ol Clear Screen command
alias gs='git status' # Abbreviation for git status
alias ll='exa --long --header --git --all'
alias stfu='osascript -e "set volume output muted true"'
alias pumpitup='osascript -e "set volume output volume 100"'
alias afk='/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend'
alias cleanup='find . -type f -name "*.DS_Store" -ls -delete' # Recursively delete `.DS_Store` files
alias chrome='/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome'
alias myip='curl http://ipecho.net/plain; echo' # echoes current ip
alias reload='source ~/.zshrc' # reloads current sessions
alias dev='cd ~/dev/'
alias work='cd ~/novicell/'

# Alias for editing init.vim, .zshrc:
alias eshell='nvim ~/code/.dotfiles/.zshrc'
alias envim='nvim ~/code/.dotfiles/nvim/init.vim'

# zsh syntax highlighting & auto suggestions
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# start up starship
eval "$(starship init zsh)"
