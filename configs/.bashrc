#Configuration settings for bash
#Author: Dave Hand
#Sourced from .bash_profile

#source the prompt for bash
if [ -f ~/.prompt_bash ]; then
  source ~/.prompt_bash
fi

#source homebrew tab completion
if [ -f $(brew --prefix)/Library/Contributions/brew_bash_completion.sh ]; then
  source $(brew --prefix)/Library/Contributions/brew_bash_completion.sh
fi

#source the bash completion file if it exists
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  source $(brew --prefix)/etc/bash_completion
fi

#set default editor
export EDITOR=vim

#use colors in terminal
export CLICOLOR=1
#use linux colors for ls - LS_COLORS on Linux
export LSCOLORS=gxBxhxDxCxhxhxhxhxcxcx


#custom functions
#colored man pages
man() {
  env \
  LESS_TERMCAP_mb=$(printf "\e[1;31m") \
  LESS_TERMCAP_md=$(printf "\e[1;31m") \
  LESS_TERMCAP_me=$(printf "\e[0m") \
  LESS_TERMCAP_se=$(printf "\e[0m") \
  LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
  LESS_TERMCAP_ue=$(printf "\e[0m") \
  LESS_TERMCAP_us=$(printf "\e[1;32m") \
  man "$@"
}

#rm puts files in the trash (Mac)
function rm() {
  local path
  for path in "$@"; do
    # ignore any arguments
    if [[ "$path" = -* ]]; then :
    else
      local dst=${path##*/}
      # append the time if necessary
      while [ -e ~/.Trash/"$dst" ]; do
        dst="$dst "$(date +%H-%M-%S)
      done
      mv "$path" ~/.Trash/"$dst"
    fi
  done
}

#update brew
bup() {
  brew update; brew upgrade --all; brew cleanup
}

cup() {
  brew update; brew upgrade brew-cask; brew cask cleanup
}

#TODO update other package managers and such: pip, gem, npm

#update everything TODO - call for other package managers too
update() {
  bup; cup
}

# check that archey is installed, then run it
if [ -x /usr/local/bin/archey ]; then
  archey -c
fi

#check that both fortune and cowsay are installed, display them
if [ -x /usr/local/bin/cowsay -a -x /usr/local/bin/fortune ]; then
  fortune | cowsay
fi

# command line access to sublime
alias sublime="open -a $HOME/Applications/Sublime\ Text\ 2.app"

# prompt formatting
export PS1="\[\033[38;5;11m\]\u\[$(tput sgr0)\]\[\033[38;5;15m\]: \[$(tput sgr0)\]\[\033[38;5;6m\]\W\[$(tput sgr0)\]\[\033[38;5;15m\] \\$\[$(tput sgr0)\] "

