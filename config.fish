set fish_greeting ""

set -gx TERM xterm-256color

# theme
set -g theme_color_scheme terminal-dark
set -g fish_prompt_pwd_dir_length 1
set -g theme_display_user yes
set -g theme_hide_hostname no
set -g theme_hostname always

###############
### Aliases ###
###############
alias v "nvim"
alias cls "clear" # Good 'ol Clear Screen command
alias gs "git status" # Abbreviation for git status
alias ll "exa -l -g --icons --git"
alias lla "ll -a"
alias reload "source ~/.zshrc" # reloads current sessions

# Alias for editing init.vim, .zshrc, alacritty.yml, .tmux.conf:
alias eshell "nvim ~/code/.dotfiles/.zshrc"
alias envim "nvim ~/code/.dotfiles/nvim/init.vim"
alias ealacritty "nvim ~/code/.dotfiles/alacritty.yml"
alias etmux "nvim ~/code/.dotfiles/.tmux.conf"

# confirm before overwriting something
alias cp "cp -i"
alias mv "mv -i"
alias rm "rm -i"

#############
## Scripts ##
#############
alias ide "sh ~/code/.dotfiles/scripts/ide.sh"

# Init starship prompt
starship init fish | source
