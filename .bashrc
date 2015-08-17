# To the extent possible under law, the author(s) have dedicated all 
# copyright and related and neighboring rights to this software to the 
# public domain worldwide. This software is distributed without any warranty. 
# You should have received a copy of the CC0 Public Domain Dedication along 
# with this software. 
# If not, see <http://creativecommons.org/publicdomain/zero/1.0/>. 

# base-files version 4.2-2

# ~/.bashrc: executed by bash(1) for interactive shells.

# The latest version as installed by the Cygwin Setup program can
# always be found at /etc/defaults/etc/skel/.bashrc

# Modifying /etc/skel/.bashrc directly will prevent
# setup from updating it.

# The copy in your home directory (~/.bashrc) is yours, please
# feel free to customise it to create a shell
# environment to your liking.  If you feel a change
# would be benifitial to all, please feel free to send
# a patch to the cygwin mailing list.

# User dependent .bashrc file

# If not running interactively, don't do anything
[[ "$-" != *i* ]] && return

# Shell Options
#
# See man bash for more options...
#
# Don't wait for job termination notification
# set -o notify
#
# Don't use ^D to exit
# set -o ignoreeof
#
# Use case-insensitive filename globbing
# shopt -s nocaseglob
#
# Make bash append rather than overwrite the history on disk
# shopt -s histappend
#
# When changing directory small typos can be ignored by bash
# for example, cd /vr/lgo/apaache would find /var/log/apache
# shopt -s cdspell

# Completion options
#
# These completion tuning parameters change the default behavior of bash_completion:
#
# Define to access remotely checked-out files over passwordless ssh for CVS
# COMP_CVS_REMOTE=1
#
# Define to avoid stripping description in --option=description of './configure --help'
# COMP_CONFIGURE_HINTS=1
#
# Define to avoid flattening internal contents of tar files
# COMP_TAR_INTERNAL_PATHS=1
#
# Uncomment to turn on programmable completion enhancements.
# Any completions you add in ~/.bash_completion are sourced last.
# [[ -f /etc/bash_completion ]] && . /etc/bash_completion

# History Options
#
# Don't put duplicate lines in the history.
# export HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups
#
# Ignore some controlling instructions
# HISTIGNORE is a colon-delimited list of patterns which should be excluded.
# The '&' is a special pattern which suppresses duplicate entries.
# export HISTIGNORE=$'[ \t]*:&:[fb]g:exit'
# export HISTIGNORE=$'[ \t]*:&:[fb]g:exit:ls' # Ignore the ls command as well
#
# Whenever displaying the prompt, write the previous line to disk
# export PROMPT_COMMAND="history -a"

# Aliases
#
# Some people use a different file for aliases
# if [ -f "${HOME}/.bash_aliases" ]; then
#   source "${HOME}/.bash_aliases"
# fi
#
# Some example alias instructions
# If these are enabled they will be used instead of any instructions
# they may mask.  For example, alias rm='rm -i' will mask the rm
# application.  To override the alias instruction use a \ before, ie
# \rm will call the real rm not the alias.
#
# Interactive operation...
# alias rm='rm -i'
# alias cp='cp -i'
# alias mv='mv -i'
#
# Default to human readable figures
# alias df='df -h'
# alias du='du -h'
#
# Misc :)
# alias less='less -r'                          # raw control characters
# alias whence='type -a'                        # where, of a sort
# alias grep='grep --color'                     # show differences in colour
# alias egrep='egrep --color=auto'              # show differences in colour
# alias fgrep='fgrep --color=auto'              # show differences in colour
#
# Some shortcuts for different directory listings
# alias ls='ls -hF --color=tty'                 # classify files in colour
# alias dir='ls --color=auto --format=vertical'
# alias vdir='ls --color=auto --format=long'
# alias ll='ls -l'                              # long list
# alias la='ls -A'                              # all but . and ..
# alias l='ls -CF'                              #

# Umask
#
# /etc/profile sets 022, removing write perms to group + others.
# Set a more restrictive umask: i.e. no exec perms for others:
# umask 027
# Paranoid: neither group nor others have any perms:
# umask 077

# Functions
#
# Some people use a different file for functions
# if [ -f "${HOME}/.bash_functions" ]; then
#   source "${HOME}/.bash_functions"
# fi
#
# Some example functions:
#
# a) function settitle
# settitle () 
# { 
#   echo -ne "\e]2;$@\a\e]1;$@\a"; 
# }
# 
# b) function cd_func
# This function defines a 'cd' replacement function capable of keeping, 
# displaying and accessing history of visited directories, up to 10 entries.
# To use it, uncomment it, source this file and try 'cd --'.
# acd_func 1.0.5, 10-nov-2004
# Petar Marinov, http:/geocities.com/h2428, this is public domain
# cd_func ()
# {
#   local x2 the_new_dir adir index
#   local -i cnt
# 
#   if [[ $1 ==  "--" ]]; then
#     dirs -v
#     return 0
#   fi
# 
#   the_new_dir=$1
#   [[ -z $1 ]] && the_new_dir=$HOME
# 
#   if [[ ${the_new_dir:0:1} == '-' ]]; then
#     #
#     # Extract dir N from dirs
#     index=${the_new_dir:1}
#     [[ -z $index ]] && index=1
#     adir=$(dirs +$index)
#     [[ -z $adir ]] && return 1
#     the_new_dir=$adir
#   fi
# 
#   #
#   # '~' has to be substituted by ${HOME}
#   [[ ${the_new_dir:0:1} == '~' ]] && the_new_dir="${HOME}${the_new_dir:1}"
# 
#   #
#   # Now change to the new dir and add to the top of the stack
#   pushd "${the_new_dir}" > /dev/null
#   [[ $? -ne 0 ]] && return 1
#   the_new_dir=$(pwd)
# 
#   #
#   # Trim down everything beyond 11th entry
#   popd -n +11 2>/dev/null 1>/dev/null
# 
#   #
#   # Remove any other occurence of this dir, skipping the top of the stack
#   for ((cnt=1; cnt <= 10; cnt++)); do
#     x2=$(dirs +${cnt} 2>/dev/null)
#     [[ $? -ne 0 ]] && return 0
#     [[ ${x2:0:1} == '~' ]] && x2="${HOME}${x2:1}"
#     if [[ "${x2}" == "${the_new_dir}" ]]; then
#       popd -n +$cnt 2>/dev/null 1>/dev/null
#       cnt=cnt-1
#     fi
#   done
# 
#   return 0
# }
# 
# alias cd=cd_func


alias svns='svn status | grep M'
alias ll='ls -lh'
alias ctags='ctags --c++-kinds=+p --fields=+iaS --extra=+q'
alias setapp='my_app=$PWD'
alias app='cd $my_app'

alias setapp1='my_app1=$PWD'
alias app1='cd $my_app1'

alias setapp2='my_app2=$PWD'
alias app2='cd $my_app2'

alias setbuild='my_build=$PWD'
alias build='cd $my_build'

alias setbuild1='my_build1=$PWD'
alias build1='cd $my_build1'

alias src='cd /cygdrive/c/source/salina'
#alias tmux='rm -rf /tmp/tmux-*; tmux'

export EDITOR=vim
export SVN_EDITOR=$HOME/.svn/svn-editor
export PATH=$HOME/root/bin:$HOME/root/shmobile-scripts:$PATH
#export PATH=/cygdrive/c/Program\ Files\ \(x86\)/Microsoft\ Visual\ Studio\ 11.0/VC/bin:$PATH

export trunk=/cygdrive/c/source/salina/sport_trunk
export salina=/cygdrive/c/source/salina/salina_branch/client/sport
export parity=/cygdrive/c/source/maui_parity/salina_maui_parity

export PATH=$PATH:/cygdrive/c/Program\ Files\ \(x86\)/Microsoft\ Visual\ Studio\ 10.0/Common7/IDE
alias vs2012="/cygdrive/c/Program\ Files\ \(x86\)/Microsoft\ Visual\ Studio\ 11.0/Common7/IDE/devenv.exe"
alias vs2013="/cygdrive/c/Program\ Files\ \(x86\)/Microsoft\ Visual\ Studio\ 12.0/Common7/IDE/devenv.exe"

alias rbt-post="rbt post --server https://review.lab.nbttech.com" 
export symbols='/cygdrive/c/source/tmp/symbols'
export share='/cygdrive/c/source/tmp'
alias CM='cmake -G "Visual Studio 11" .. -DVERSION:STRING="5.0.0 #25_Oct14" -DPRODUCT_VERSION:STRING="80.0.24.24"'
alias apt='apt-cyg'
alias svn-diff="svn status -q | awk '{print $2}' | xargs -n 1 svn diff"

alias failed_proj="grep -i \"Build FAILED\" all_build.txt  | cut -d \">\" -f1 | awk  '{printf \"-i \\\"^%d>---\\\" all_build.txt\n\", \$1}' | xargs -n 3 grep | cut -d \" \" -f5 | cut -d \",\" -f1"

alias data='cd /cygdrive/c/ProgramData/Riverbed/Steelhead_Mobile/log'
alias logger_off='net stop RVBD_SH_Mobile_Logger'
alias logger_on='net start RVBD_SH_Mobile_Logger'
alias log='cd /cygdrive/c/ProgramData/Riverbed/Steelhead_Mobile/log'
alias bugs='cd /cygdrive/c/source/bugs'
alias ser='find ./client/sport -name'
alias resolve='svn resolve --accept working'
alias clean_diff='filterdiff --clean'
alias code='cd ~/code'
alias svn_diff_all="svn status -q | awk '{print $2}' | xargs -n 1 svn diff "
alias svn_externals='svn propedit svn:externals .'
alias git_diff='git difftool --tool=vimdiff --no-prompt'
alias ims='cd /cygdrive/c/personal/'
alias scp='scp -C'
export PATH=$PATH:/cygdrive/c/Program\ Files\ \(x86\)\/CMake\/bin

export PATH=$PATH:/cygdrive/c/Users/ksrinivaspura/.dnx/runtimes/dnx-clr-win-x86.1.0.0-beta4/bin
