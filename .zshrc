export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


###############
### Aliases ###
###############
alias reload!='. ~/.zshrc'
alias cls='clear' # Good 'ol Clear Screen command
alias gs='git status' # Abbreviation for git status
alias l='ls -al' # shorter list command for: "ls -al"
alias stfu='osascript -e "set volume output muted true"'
alias pumpitup='osascript -e "set volume output volume 100"'
alias afk='/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend'
alias cleanup='find . -type f -name "*.DS_Store" -ls -delete' # Recursively delete `.DS_Store` files
alias chrome='/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome'
alias myip='curl http://ipecho.net/plain; echo' # echoes current ip
alias reload='source ~/.zshrc' # reloads current sessions

alias dev='cd ~/dev/'

# zsh syntax highlighting & auto suggestions
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# start up starship
eval "$(starship init zsh)"
