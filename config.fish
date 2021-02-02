### abbreviations ###
abbr -a gs 'git status'
abbr -a gd 'cd ~/Google\ Drive'
abbr -a dl 'cd ~/Downloads'
abbr -a dt 'cd ~/Desktop'
abbr -a l 'ls -al'

# fun stuff
abbr -a stfu "osascript -e 'set volume output muted true'"
abbr -a pumpitup "osascript -e 'set volume output volume 100'"
abbr -a afk "/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"

# Recursively delete `.DS_Store` files
abbr -a cleanup "find . -type f -name '*.DS_Store' -ls -delete"
# Google Chrome
abbr -a chrome '/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome'


### paths ###
# flutter
set PATH /Users/nikolaj/dev/flutter/flutter/bin $PATH


#### colored man output ###
# from http://linuxtidbits.wordpress.com/2009/03/23/less-colors-for-man-pages/
setenv LESS_TERMCAP_mb \e'[01;31m'       # begin blinking
setenv LESS_TERMCAP_md \e'[01;38;5;74m'  # begin bold
setenv LESS_TERMCAP_me \e'[0m'           # end mode
setenv LESS_TERMCAP_se \e'[0m'           # end standout-mode
setenv LESS_TERMCAP_so \e'[38;5;246m'    # begin standout-mode - info box
setenv LESS_TERMCAP_ue \e'[0m'           # end underline
setenv LESS_TERMCAP_us \e'[04;38;5;146m' # begin underline

#function fish_prompt
#	set_color brblack
#	echo -n "["(date "+%H:%M")"] "
#	set_color blue
#	echo -n (whoami)
#	if [ $PWD != $HOME ]
#		set_color brblack
#		echo -n ':'
#		set_color yellow
#		echo -n (basename $PWD)
#	end
#	set_color green
#	printf '%s ' (__fish_git_prompt)
#	set_color red
#	echo -n '$ '
#	set_color normal
#end

# Dracula Color Palette
set -l foreground f8f8f2
set -l selection 44475a
set -l comment 6272a4
set -l red ff5555
set -l orange ffb86c
set -l yellow f1fa8c
set -l green 50fa7b
set -l purple bd93f9
set -l cyan 8be9fd
set -l pink ff79c6

# Syntax Highlighting Colors
set -g fish_color_normal $foreground
set -g fish_color_command $cyan
set -g fish_color_quote $yellow
set -g fish_color_redirection $foreground
set -g fish_color_end $orange
set -g fish_color_error $red
set -g fish_color_param $purple
set -g fish_color_comment $comment
set -g fish_color_match --background=$selection
set -g fish_color_selection --background=$selection
set -g fish_color_search_match --background=$selection
set -g fish_color_operator $green
set -g fish_color_escape $pink
set -g fish_color_autosuggestion $comment

# Completion Pager Colors
set -g fish_pager_color_progress $comment
set -g fish_pager_color_prefix $cyan
set -g fish_pager_color_completion $foreground
set -g fish_pager_color_description $comment


### fish greeting ###
function fish_greeting
	fortune | cowsay
end


### init of starship prompt ###
starship init fish | source
