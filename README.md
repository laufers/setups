#### Introduction

These files are the ones I use to set up my shell environment for the two primary shells that I use, tcsh and bash. Bash is now the primary shell of choice.

Many of the cshell aliases needed to be converted to bash functions.

Some of the alias commands are from a time when I was doing more system administration work.

#### Installing

This repository installs as the directory "setups" which I clone into my ${HOME}. In my ${HOME} I then link the appropriate file and replace the current dot-file equivalent.

`ln -s ${HOME}/setups/bash_profile ${HOME}/.bash_profile`

From the bash_profile, I then source the bash_alias and bash_function files.

I execute the setup_env.sh script to download and install the git_prompt and git_complete program (which I believe are now included in current versions of git2.x). I like having tab complete with git and also seeing what branch I may be working with as part of my prompt. 
