# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

export LESS=' -R -X -E '
export GOPATH="/Users/clong/go"
export EDITOR="/usr/local/bin/nano"
export VAGRANT_DEFAULT_PROVIDER=vmware_desktop
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad
export BASH_SILENCE_DEPRECATION_WARNING=1
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES # Fix for some Ansible issues
export PATH="$PATH:/usr/local/bin:/usr/local/go/bin:/Users/clong/Library/Python/3.7/bin:/var/root/Library/Python/3.7/bin"
export SHELL="/bin/bash"
export PROMPT_COMMAND="history -a"
export HISTFILESIZE=""
export HISTSIZE=500000
export HISTTIMEFORMAT="[%F %T] "
export HISTCONTROL=ignoreboth # don't put duplicate lines in the history.

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# append to the history file, don't overwrite it
shopt -s histappend

# Check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
fi

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# Alias definitions.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

source ~/.iterm2_shell_integration.bash

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/clong/google-cloud-sdk/path.bash.inc' ]; then . '/Users/clong/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/clong/google-cloud-sdk/completion.bash.inc' ]; then . '/Users/clong/google-cloud-sdk/completion.bash.inc'; fi
