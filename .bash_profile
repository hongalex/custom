#################################################################################
###############################   JAVA   ########################################
#################################################################################

export JAVA_HOME8=/Library/Java/JavaVirtualMachines/jdk1.8.0_60.jdk/Contents/Home/

export JAVA_HOME=$JAVA_HOME8

export PATH=$JAVA_HOME/bin:$PATH

#################################################################################
###############################  ANDROID ########################################
#################################################################################

export ANDROID_HOME=/Users/Alex/Library/Android/sdk

export PATH=${PATH}:/Users/Alex/Library/Android/sdk/platform-tools:/Users/Alex/Library/Android/sdk/tools

#################################################################################
###############################   SYSTEM   ######################################
#################################################################################

# COLOR LS
export PS1='\[\e[0;33m\]\u\[\e[0m\]@\[\e[0;32m\]\h\[\e[0m\]:\[\e[0;34m\]\w\[\e[0m\]\$ '

export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

#################################################################################
###############################   OTHER   #######################################
#################################################################################

export PATH=/opt/apache-maven/bin:$PATH

export PATH="/opt/local/bin:/opt/local/sbin:$PATH"

export PATH="/usr/local/bin:$PATH"

alias cd571hw='cd ~/fall2017/cs571/homework'
alias cdweb='cd /Library/WebServer/Documents'
alias python="python3"

###-begin-npm-completion-###
#
# npm command completion script
#
# Installation: npm completion >> ~/.bashrc  (or ~/.zshrc)
# Or, maybe: npm completion > /usr/local/etc/bash_completion.d/npm
#

if type complete &>/dev/null; then
  _npm_completion () {
    local words cword
    if type _get_comp_words_by_ref &>/dev/null; then
      _get_comp_words_by_ref -n = -n @ -w words -i cword
    else
      cword="$COMP_CWORD"
      words=("${COMP_WORDS[@]}")
    fi

    local si="$IFS"
    IFS=$'\n' COMPREPLY=($(COMP_CWORD="$cword" \
                           COMP_LINE="$COMP_LINE" \
                           COMP_POINT="$COMP_POINT" \
                           npm completion -- "${words[@]}" \
                           2>/dev/null)) || return $?
    IFS="$si"
  }
  complete -o default -F _npm_completion npm
elif type compdef &>/dev/null; then
  _npm_completion() {
    local si=$IFS
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
