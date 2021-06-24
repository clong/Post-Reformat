# Enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# Some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias ls='ls -h'

# Command Aliases
alias tf="terraform"
alias nano="/usr/local/bin/nano -w"
alias winrm="~/go/bin/winrm-cli -username 'vagrant' -password 'vagrant'"

# Helper Aliases
alias dockershell="docker run --rm -i -t --entrypoint=/bin/bash"
alias dockershellsh="docker run --rm -i -t --entrypoint=/bin/sh"
alias maintainbrew='brew update && brew upgrade && brew cleanup -s'
alias gbr='git branch | grep -v "master" | grep -v "main" | xargs git branch -D' # Delete all local branches except master and main

# Utilities
alias urlencode='python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1])"'
alias urldecode='python -c "import sys, urllib as ul; print ul.unquote_plus(sys.argv[1])"'
alias updatedb='sudo /usr/libexec/locate.updatedb'
alias perms='stat -f "%0Lp"'
alias myip='dig +short myip.opendns.com @resolver1.opendns.com'

# Docker Stuff
# https://github.com/sdcampbell/Dockerfiles/blob/master/Metasploit/README.md
function msf() {
   if [ -z "$(docker network ls | grep -w msf)" ];
   then
       docker network create --subnet=172.18.0.0/16 msf
   fi
   if [ -z "$(docker ps -a | grep -w postgres)" ];
   then
       docker run --ip 172.18.0.2 --network msf --rm --name postgres -v "${HOME}/.msf4/database:/var/lib/postgresql/data" -e POSTGRES_PASSWORD=postgres -e POSTGRES_USER=postgres -e POSTGRES_DB=msf -d postgres:11-alpine
   fi
   docker run --rm -it --network msf --name msf --ip 172.18.0.3 -e DATABASE_URL='postgres://postgres:postgres@172.18.0.2:5432/msf' -v "${HOME}/.msf4:/home/msf/.msf4" -v "${HOME}/opt/metasploit/wordlists:/home/msf/wordlists" -v "${HOME}/opt/SecLists:/home/msf/SecLists" -v "$( pwd ):/home/msf/data" -p 8443-8500:8443-8500 metasploitframework/metasploit-framework
 }

# https://blog.ropnop.com/docker-for-pentesters/
function dockershellhere() {
    dirname=${PWD##*/}
    docker run --rm -it --entrypoint=/bin/bash -v `pwd`:/${dirname} -w /${dirname} "$@"
}
function dockershellshhere() {
    dirname=${PWD##*/}
    docker run --rm -it --entrypoint=/bin/sh -v `pwd`:/${dirname} -w /${dirname} "$@"
}
