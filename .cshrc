########################################################################
# Sugiyama : updated version 3/95 : iris (SGI INDY)
#          : .login sourced after .cshrc
########################################################################
if ($?USER == 0 || $?prompt == 0) exit

set lpath = ( . ${HOME}/bin ${HOME}/work ${HOME}/perl ${HOME}/admin ${HOME}/scripts )
set path = ( $path /usr/X11R6/bin /usr/local/bin $lpath ) 

umask 022
########################################################################
# set environmental variables
# set TCAT for man pages on SGI (troff n/a on OSF)
########################################################################
setenv HOSTNAME `hostname -s`
#setenv HOSTNAME `uname -n`
#setenv HOSTNAME "stonefly"
#setenv TERM xterm

########################################################################
# if terminal type not already set enquire for TERM 
# if terminal type vt300 (xterminal from VMS) change TERM to xterm
########################################################################
if ($?TERM == 0 || $TERM == "network" ) then
   set noglob; eval `tset -m ':?' -Q -s`; unset noglob
endif
if( $TERM == "vt300" ) setenv TERM xterm

########################################################################
# customize prompt and window headers
#    header : alias header 'echo -n "]l\!*\"'
#             eval "$header"
#           : set header='echo -n "]0;"${baseprompt} - $cwd""'
#           : xtitle "$cwd"'
#    prompt : set baseprompt ="`hostname|sed 's/^.*-//'` \!>"
#           : set baseprompt = ${baseprompt[1]}
#           : set prompt="\! ${cwd} >"'
#           : set prompt="\! `hostname` >"'
# stty tabs intr "^C" quit "^P" kill "^U" erase "" echoe
# no longer need to resize xterm windows with eval resize
########################################################################
set baseprompt="`echo $HOSTNAME`"
set prompt="${baseprompt}($cwd:t)> "
set whoisit = `/usr/bin/whoami`
if ( $whoisit == "root") then
   set prompt="${baseprompt}($cwd:t)# " 
   endif

alias precmd "source ~/bin/setprompt"
   set header=''
   set header='echo -n "]0;"${baseprompt} -        $cwd:t""'
   stty tabs intr "^C" quit "^P" kill "^U"  erase "^H" echoe

#switch ($TERM)
#case dtterm:
#   set header=''
#   set header='echo -n "]0;"${baseprompt} -        $cwd:t""'
#   stty tabs intr "^C" quit "^P" kill "^U"  erase "^H" echoe
#   breaksw
#case xterm:
#   set header=''
#   set header='echo -n "]0;"${baseprompt} -        $cwd:t""'
#   stty tabs intr "^C" quit "^P" kill "^U"  erase "^H" echoe
#   breaksw
#case xterm-color:
#   set header=''
#   set header='echo -n "]0;"${baseprompt} -        $cwd:t""'
#   stty tabs intr "^C" quit "^P" kill "^U"  erase "^H" echoe
#   breaksw
#case xterm-256color:
#   set header=''
#   set header='echo -n "]0;"${baseprompt} -        $cwd:t""'
#   stty tabs intr "^C" quit "^P" kill "^U"  erase "^H" echoe
#   breaksw
#case vt100:
#   set header=''
#   set header='echo -n "]0;"${baseprompt} -        $cwd:t""'
#   stty tabs intr "^C" quit "^P" kill "^U"  erase "^H" echoe
#   breaksw
#case vt220:
#   stty tabs intr "^C" quit "^P" kill "^U" erase "^H" echoe
#   breaksw
#endsw

########################################################################
# set path, search path wspath, search path for cd cdpath 
set cdpath = ( . $HOME )
set wbpath = ( $path )
set wspath = ( /usr/lib/X11 )

########################################################################
# set shell properties
limit coredumpsize 1
set history = 250
set savehist = ($history merge)
set histdup = erase
set noclobber
set ignoreeof
set notify
set filec
unset autologout
set ampm
set listjobs = long
set dunique
set dextract
#set watch = (1 any any)
set who = ("%n from %M --- %a ")
#set who = ("%n from %M --- %a %l")
set correct = all
#set mail="60 /var/mail/`/usr/ucb/whoami`" 
set notify
set pushdsilent
set symlinks = ignore
set autolist = ambiguous

########################################################################
# a few more setenv commands
setenv EDB_XTERM 'xterm -fn screen15 -geometry 80x50+0-125 -sb -sl 5000 -bg slateblue4 -fg white -n %T -T %T -xrm "XTerm*allowSendEvents: True" -e'
#setenv PERLLIB /usr/local/perl5:$HOME/lib/perl:/usr/local/rrdtool-1.0.33/lib/perl:.

#######################################################################
#      set personal aliases here
source ${home}/.aliases
source ${home}/.gitalias
#source /usr/local/nawips/Gemenviron
#source ${home}/scripts/colorssh/aliases.mine

#######################################################################
#      source macports here
set path=($path /opt/local/bin /opt/local/sbin)

#######################################################################
#  	set manpath
#setenv MANPATH ${MANPATH}:/usr/local/share/man:/opt/local/man

#######################################################################
#   set display localhost
#setenv DISPLAY :0.0

######################################################################
# path for git
setenv PATH /usr/local/git/bin:$PATH

set OS = `uname`
switch ($OS)
case Linux:
   # Setting PATH for EPD
   set path=(/usr/local/epd/bin $path)
   # Setting PATH for Anaconda
   #   set path=(/home/laufers/anaconda/bin $path)
   breaksw
case Darwin:
   set path=(/Library/Frameworks/EPD64.framework/Versions/Current/bin $path)
   # Setting PATH for Anaconda
   set path=(/Users/laufers/anaconda/bin $path)
   breaksw
endsw

# Setting path for Anaconda
# #
# set path=(/Users/laufers/anaconda/bin $path)
