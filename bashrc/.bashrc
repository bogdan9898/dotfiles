#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# set the prompt to [user@host working_dir]$
PS1='[\u@\h \W]\$ '

#
# # ex - archive extractor
# # usage: ex <file>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1     ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

cdls() {
	cd "$@" && ls -lha
}

########################################

alias "c=xclip -selection clipboard"
alias "v=xclip -o -selection clipboard"
alias ls='ls --color=auto'
alias godot-gpu="nohup prime-run godot --video-driver GLES3"
alias new-svelte="npx degit sveltejs/template"

# turn off annoying beep sound
xset b off
xset b 0 0 0


