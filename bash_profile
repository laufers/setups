# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# set colors, edit or swtich colors here
source ${HOME}/setups/bash_colors
# include aliases, edit aliases there
source ${HOME}/setups/bash_alias
# include functions, edit functions there
source ${HOME}/setups/bash_func

# set history characteristics
export HISTCONTROL=ignoredups:erasedups # no duplicate entries
export HISTSIZE=5000                   	# big big history
export HISTFILESIZE=10000               # big big history
shopt -s histappend   					# append history
shopt -s histverify   					# edit history recall

# set to allow vi edits on the command line
set -o vi

#   set path as window title
PROMPT_COMMAND='echo -ne "\033];${PWD}\007"'

#   git prompt
if [ -f ~/.git-prompt.sh ]; then
  . ~/.git-prompt.sh
fi

#   git completion
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

#   prompt with git
PS1="\[$Cyan\]\h\[$Yellow\]\[$Yellow\](\W)\[\033[m\]\[$BBlue\]\$(__git_ps1)\[$BWhite\]> \[$Color_Off\]"
#PS1="$Cyan\h$Yellow(\W)$BBlue\$(__git_ps1)$BWhite> $Color_Off"

#  Setting initial paths for myself

#   Setting path for LaTex from MacTeX
export PATH=/Library/TeX/texbin:$PATH

#   Base path
export PATH=.:${HOME}/bin:${HOME}/work:${HOME}/perl:${HOME}/admin:${HOME}/scripts:${HOME}/.local/bin:$PATH

#  Setting CDPATH
export CDPATH=:$HOME:/Users/laufers/Dropbox\ \(Univ.\ of\ Oklahoma\)/OULibraries

#  Setting paths for anaconda python

OS=`uname`
case $OS in
	Linux)
		# Setting PATH for Anaconda
		export PATH=${HOME}/anaconda3/bin:$PATH
		;;

	Darwin)
   		# Setting PATH for Anaconda
		export PATH=/Users/laufers/anaconda3/bin:$PATH
		;;
esac

#   Setting path for acquia drupal install
export PATH=$PATH:/Applications/DevDesktop/drush

#  added path for LoC Bagger
export PATH=$PATH:/usr/local/bagger/bin
