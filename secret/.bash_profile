for file in ~/.{bashrc,aliases}; do
  [ -r "$file" ] && source "$file"
done
unset file


# # Virtual ENv
# export WORKON_HOME=~/.virtualenvs
# export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python
# . /usr/local/share/python/virtualenvwrapper.sh

# NVM
. ~/nvm/nvm.sh

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# PATH
PATH=$PATH:/usr/local/sbin:/usr/local/share/python:/usr/local/bin/:/Users/elgreg/dev/pebble/arm-cs-tools/bin
export PATH

# JAVA Home (aws requires)
export JAVA_HOME="$(/usr/libexec/java_home)"

# Identity
export WAPO_CONFIG="/Users/elgreg/dev/wapolabs-config/"
export GRAILS_HOME="/Users/elgreg/.gvm/grails/current/bin/grails"
export GROOVY_HOME="/Users/elgreg/.gvm/groovy/current/bin/groovy"


# AWS
export EC2_HOME="/usr/local/Cellar/ec2-api-tools/1.6.12.0/libexec"
export EC2_AMITOOL_HOME="/usr/local/Library/LinkedKegs/ec2-ami-tools/jars"
export AWS_ELB_HOME="/usr/local/Cellar/elb-tools/1.0.23.0/libexec"
export AWS_AUTO_SCALING_HOME="/usr/local/Library/LinkedKegs/auto-scaling/jars"
source ~/keys/.aws_dev

# Deployment Crap
export me="greglavallee"
export BUILD_BOX='ec2-107-22-101-189.compute-1.amazonaws.com'
export CANARY='54.197.240.62'

# history stuff
export HISTIGNORE="&:ls:[bf]g:exit"
export HISTCONTROL=erasedups
export HISTSIZE=20000
shopt -s histappend


# Git
# ========
# hub
alias git=hub
alias gut=git

# Completion
source ~/.git-completion.sh
export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWSTASHSTATE=true
export GIT_PS1_SHOWUNTRACKEDFILES=true
source ~/.git-prompt.sh
# PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '

#PS1='\w$(__git_ps1 " (%s)")>'
PS1='\[\033[0m\]\w\[\033[1;33m\]$(__git_ps1 "(%s)")\[\033[0m\] \$ '
# PS1='\[\033[0m\]\w\[\033[1;33m\]$(__git_ps1 "(%s)")\[\033[0m\] \$ '

alias gitx='open -a /Applications/GitX.app/Contents/MacOS/GitX'

alias cdg='cd "$(git rev-parse --show-toplevel)"'

# BrowserStackTunnel
alias bstack='java -jar ~/Library/Extensions/Java/BrowserStackTunnel.jar 78zZwF2x179yqxKEqdsN localhost,8000,0'

alias nose='nosetests -sv'
# NPM Completion
# ==============
###-begin-npm-completion-###
#
# npm command completion script
#
# Installation: npm completion >> ~/.bashrc  (or ~/.zshrc)
# Or, maybe: npm completion > /usr/local/etc/bash_completion.d/npm
#

COMP_WORDBREAKS=${COMP_WORDBREAKS/=/}
COMP_WORDBREAKS=${COMP_WORDBREAKS/@/}
export COMP_WORDBREAKS

if type complete &>/dev/null; then
  _npm_completion () {
    local si="$IFS"
    IFS=$'\n' COMPREPLY=($(COMP_CWORD="$COMP_CWORD" \
                           COMP_LINE="$COMP_LINE" \
                           COMP_POINT="$COMP_POINT" \
                           npm completion -- "${COMP_WORDS[@]}" \
                           2>/dev/null)) || return $?
    IFS="$si"
  }
  complete -F _npm_completion npm
elif type compdef &>/dev/null; then
  _npm_completion() {
    si=$IFS
    compadd -- $(COMP_CWORD=$((CURRENT-1)) \
                 COMP_LINE=$BUFFER \
                 COMP_POINT=0 \
                 npm completion -- "${words[@]}" \
                 2>/dev/null)
    IFS=$si
  }
  compdef _npm_completion npm
elif type compctl &>/dev/null; then
  _npm_completion () {
    local cword line point words si
    read -Ac words
    read -cn cword
    let cword-=1
    read -l line
    read -ln point
    si="$IFS"
    IFS=$'\n' reply=($(COMP_CWORD="$cword" \
                       COMP_LINE="$line" \
                       COMP_POINT="$point" \
                       npm completion -- "${words[@]}" \
                       2>/dev/null)) || return $?
    IFS="$si"
  }
  compctl -K _npm_completion npm
fi
###-end-npm-completion-###

export PROMPT_COMMAND='echo -ne "\033]0;$(basename "$PWD")\007"'



## Pebble!

#THIS MUST BE AT THE END OF THE FILE FOR GVM TO WORK!!!
[[ -s "/Users/elgreg/.gvm/bin/gvm-init.sh" ]] && source "/Users/elgreg/.gvm/bin/gvm-init.sh"


## todo.txt
source ~/todo_completion.sh
alias t='/Users/elgreg/todo.txt/todo.sh'
complete -F _todo t


## remote_length
function remote_length() {
    curl -sI $1 | grep Content-Length
}

alias clc='echo -n `history -p !!` | pbcopy'

# Deployment Crap
export me="greglavallee"
export BUILD_BOX='ec2-54-221-28-252.compute-1.amazonaws.com'
export CANARY='54.197.240.62'


