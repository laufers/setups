# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# set colors, edit or swtich colors here

if [ -f "${HOME}/setups/bash_colors" ]; then
    source ${HOME}/setups/bash_colors
fi 

# include aliases, edit aliases here
if [ -f "${HOME}/setups/bash_alias" ]; then
    source ${HOME}/setups/bash_alias
fi

# include functions, edit functions here
if [ -f "${HOME}/setups/bash_func" ]; then
    source ${HOME}/setups/bash_func
fi

# set history characteristics
export HISTCONTROL=ignoredups:erasedups # no duplicate entries
export HISTSIZE=5000                   	# big big history
export HISTFILESIZE=10000               # big big history
shopt -s histappend   					# append history
shopt -s histverify   					# edit history recall

# remove highlighting pasted text
bind "set enable-bracketed-paste off"

# set to allow vi edits on the command line
set -o vi

#   set path as window title
PROMPT_COMMAND='echo -ne "\033];${PWD}\007"'

#   git prompt
#if [ -f ~/.git-prompt.sh ]; then
#  . ~/.git-prompt.sh
#fi

#   bash git prompt
GIT_PROMPT_THEME=Single_line_Minimalist_2
#GIT_PROMPT_THEME=
#GIT_PROMPT_THEME=Custom
#GIT_PROMPT_THEME=Default

if [ -f "$HOME/.bash-git-prompt/gitprompt.sh" ]; then
    GIT_PROMPT_ONLY_IN_REPO=1
    source $HOME/.bash-git-prompt/gitprompt.sh
fi

#   git completion
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
elif [ -f "/usr/local/etc/bash_completion.d/git-completion.bash" ]; then
  . /usr/local/etc/bash_completion.d/git-completion.bash
fi

#   prompt with git
PS1="\[$Cyan\]\h\[$Yellow\]\[$Yellow\](\W)\[\033[m\]\[$BBlue\]\[$BWhite\]-> \[$Color_Off\]"
#PS1="$Cyan\h$Yellow(\W)$BBlue\$(__git_ps1)$BWhite> $Color_Off"

#  Setting initial paths for myself

#   Base path
export PATH=.:${HOME}/bin:${HOME}/perl:${HOME}/scripts:${HOME}/.local/bin:$PATH

#   Setting path for LaTex from MacTeX
export PATH=/Library/TeX/texbin:$PATH

#	Setting path for HomeBrew ruby
export PATH=/usr/local/opt/ruby\@2/bin:/usr/local/lib/ruby/gems/2.7.0/bin:$PATH
# export PATH=/usr/local/opt/ruby/bin:$PATH

#   Setting path for Sublime Text
export PATH="/Applications/Sublime Teffxt.app/Contents/SharedSupport/bin:$PATH"

#  Setting CDPATH
export CDPATH=:$HOME:/Users/laufers/Dropbox\ \(Univ.\ of\ Oklahoma\)/OULibraries

# turn off Apple zsh message
export BASH_SILENCE_DEPRECATION_WARNING=1

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/laufers/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/laufers/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/laufers/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/laufers/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# ahj - remove the default Python environment artifact "(base)" from prompt
PS1=$(echo "$PS1" | perl -pe 's/^\(base\)\s*//' )

