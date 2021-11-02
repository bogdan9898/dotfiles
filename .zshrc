zstyle :compinstall filename '/home/bogdan/.zshrc'

autoload -Uz compinit
compinit

autoload -U colors
colors

# export PS1="%(!.%{$fg_bold[red]%}%~ #.%{$fg_bold[green]%}%~ %{$fg_bold[magenta]%}>) %{$reset_color%}"
autoload -U promptinit; promptinit
prompt spaceship

HISTFILE=~/.zsh_history
HISTSIZE=50000
SAVEHIST=50000

# append history to the history file (no overwriting)
setopt appendhistory

# share history across terminals
setopt sharehistory

# immediately append to the history file, not just when a term is killed
setopt incappendhistory

# disable annoying beep
unsetopt beep

# don't throw errors when there is no match
unsetopt nomatch

# don't autocd
unsetopt autocd

# emacs input mode
bindkey -e

# match current input to history items
# bind to up arrow and down arrow
bindkey '^[[A' up-line-or-search
bindkey '^[[B' down-line-or-search

# autoload -Uz vcs_info
# precmd_vcs_info() { vcs_info }
# precmd_functions+=( precmd_vcs_info )
# setopt prompt_subst
# RPROMPT=\$vcs_info_msg_0_
# zstyle ':vcs_info:git:*' formats '%F{240}(%b)%r%f'
# zstyle ':vcs_info:*' enable git

# exit when CTRL+D
exit_zsh() { exit }
zle -N exit_zsh
bindkey '^D' exit_zsh

# enable zsh syntax highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# aliases
alias ls="ls --color=always" # maybe someday i'll customize the colors
alias adog="git log --all --decorate --oneline --graph"
alias fuzzy-pacman="pacman -Slq | fzf --multi --preview 'pacman -Si {1}' | xargs -ro sudo pacman -Sy"
alias fuzzy-yay="yay -Slq | fzf -m --preview 'cat <(yay -Si {1}) <(yay -Fl {1} | awk \"{print $2}\")' | xargs -ro  yay -Sy"
alias update-grub="sudo grub-mkconfig -o /boot/grub/grub.cfg"
alias clipin="xclip -selection clipboard -i -rmlastnl"
alias clipout="xclip -selection clipboard -o && echo"
alias gs="git status"
# alias calc-sha256='echo -n @(args) | sha256sum | cut -d " " -f1'
# alias calc-md5='echo -n @(args) | md5sum | cut -d " " -f1'
alias lla="ls -lha"
alias htop="htop -t"

# Turn off system beep
xset b off
xset b 0 0 0
