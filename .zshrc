# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

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
# VIM like alias'
alias :q="exit"

#############
## Scripts ##
#############
alias ide='sh ~/code/.dotfiles/scripts/ide.sh'

# Add Powerlevel10k
source /usr/local/opt/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
