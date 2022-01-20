### Aliases ###
alias v='nvim'
alias ll='exa -l -g --icons --git'
alias lla='ll -a'
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

# Fish prompt
function fish_prompt
	set_color brblack
	echo -n "["(date "+%H:%M")"] "
	set_color blue
	echo -n (hostname)
	if [ $PWD != $HOME ]
		set_color brblack
		echo -n ':'
		set_color yellow
		echo -n (basename $PWD)
	end
	set_color green
	printf '%s ' (__fish_git_prompt)
	set_color red
	echo -n '| '
	set_color normal
end
