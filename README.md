These files are the ones I use to set up my shell environment for the two primary shells that I use, tcsh and bash. Bash is now the primary shell of choice. 

Many of the cshell aliases needed to be converted to bash functions. 

Some of the alias commands are from when I was doing more system administration. 

This repository installs as the directory "setups". In my ${HOME} I then link the appropriate file and replace the current dot-file equivalent.

`ln -s ${HOME}/setups/bash_profile ${HOME}/.bash_profile`