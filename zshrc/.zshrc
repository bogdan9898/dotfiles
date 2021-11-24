## Options section
setopt appendhistory                                             # append history to the history file (no overwriting)
setopt sharehistory                                              # share history across terminals
setopt incappendhistory                                          # immediately append to the history file, not just when a term is killed
unsetopt beep                                                    # disable annoying beep
unsetopt nomatch                                                 # don't throw errors when there is no match
unsetopt autocd                                                  # don't autocd


# Turn off system beep
xset b off
xset b 0 0 0


HISTFILE=~/.zsh_history
HISTSIZE=50000
SAVEHIST=50000
WORDCHARS=${WORDCHARS//\/[&.;]}                                  # Don't consider certain characters part of the word
export EDITOR=/usr/bin/nano


zstyle :compinstall filename '/home/bogdan/.zshrc'
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'        # Case insensitive tab completion
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"          # Colored completion (different colors for dirs/files/etc)
zstyle ':completion:*' rehash true                               # automatically find new executables in path 
# Speed up completions
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache


autoload -Uz compinit; compinit
autoload -U colors; colors
autoload -U promptinit; promptinit
prompt spaceship


## Keybindings section
bindkey -e                                                       # emacs input mode
bindkey '^[[7~' beginning-of-line                                # Home key
bindkey '^[[H' beginning-of-line                                 # Home key
if [[ "${terminfo[khome]}" != "" ]]; then
  bindkey "${terminfo[khome]}" beginning-of-line                 # [Home] - Go to beginning of line
fi
bindkey '^[[8~' end-of-line                                      # End key
bindkey '^[[F' end-of-line                                       # End key
if [[ "${terminfo[kend]}" != "" ]]; then
  bindkey "${terminfo[kend]}" end-of-line                        # [End] - Go to end of line
fi
# bindkey '^[[2~' overwrite-mode                                   # Insert key
bindkey '^[[3~' delete-char                                      # Delete key
bindkey '^[[C'  forward-char                                     # Right key
bindkey '^[[D'  backward-char                                    # Left key
bindkey '^[[5~' history-beginning-search-backward                # Page up key
bindkey '^[[6~' history-beginning-search-forward                 # Page down key

# Navigate words with ctrl+arrow keys
bindkey '^[Oc' forward-word
bindkey '^[Od' backward-word
bindkey '^[[1;5D' backward-word
bindkey '^[[1;5C' forward-word
bindkey '^H' backward-kill-word                                  # delete previous word with ctrl+backspace
# bindkey '^[[Z' undo                                              # Shift+tab undo last action
# bindkey "^R" history-incremental-search-backward                 # for non-pattern search like in bash 
# bindkey "^R" history-incremental-pattern-search-backward         # for pattern search (the wildcard * will use zsh completion)

# match current input to history items
# bind to up arrow and down arrow
bindkey '^[[A' up-line-or-search
bindkey '^[[B' down-line-or-search


# exit when EOL(CTRL+D)
exit_zsh() { exit }
zle -N exit_zsh
bindkey '^D' exit_zsh


# Color man pages
export LESS_TERMCAP_mb=$'\E[01;32m'
export LESS_TERMCAP_md=$'\E[01;32m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;47;34m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;36m'
export LESS=-r


# plugins
source /usr/share/zsh/plugins/zsh-autoswitch-virtualenv/autoswitch_virtualenv.plugin.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh             # this file must be the las one loaded


# append to PATH
path+=~/.local/bin
export PATH         # export PATH=$PATH:~/.local/bin


## Alias section
alias cp="cp -i"                                                 # Confirm before overwriting something
alias df='df -h'                                                 # Human-readable sizes
alias free='free -m'                                             # Show sizes in MB
alias ls="ls --color=always"                                     # maybe someday i'll customize the colors
alias fuzzy-pacman="pacman -Slq | fzf --multi --preview 'pacman -Si {1}' | xargs -ro sudo pacman -Sy"
alias fuzzy-yay="yay -Slq | fzf -m --preview 'cat <(yay -Si {1}) <(yay -Fl {1} | awk \"{print $2}\")' | xargs -ro  yay -Sy"
alias update-grub="sudo grub-mkconfig -o /boot/grub/grub.cfg"
alias clipin="xclip -selection clipboard -i -rmlastnl"
alias clipout="xclip -selection clipboard -o && echo"
alias gs="git status"
alias gitacp='git add . && git commit && git push'
alias adog="git log --all --decorate --oneline --graph"
# alias calc-sha256='echo -n @(args) | sha256sum | cut -d " " -f1'
# alias calc-md5='echo -n @(args) | md5sum | cut -d " " -f1'
alias lla="ls -lha"
alias htop="htop -t"
alias ydl="youtube-dl -x --audio-format mp3"



