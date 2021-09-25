# Editor
EDITOR=nvim
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

#############
## Scripts ##
#############
alias ide='sh ~/code/.dotfiles/scripts/ide.sh'

#############
## Prompt  ##
#############
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
zstyle ':vcs_info:git:*' formats '%F{7}(%b)%r%f'
zstyle ':vcs_info:*' enable git
# Set up the prompt (with git branch name)
PROMPT='%F{8}%B%n >%F{1} %1~ ${u2192} %f$%b '
RPROMPT=\$vcs_info_msg_0_

