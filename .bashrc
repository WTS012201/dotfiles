#
# ~/.bashrc
#

# If not running interactively, don't do anything

set -o vi
export EDITOR='vi'
export VISUAL='vi'

[[ $- != *i* ]] && return
alias ls='ls --color=auto'
#PS1='\e[1;34m[\u@\h \W]\e[m λ '
PS1='\[\e[32m\][\[\e[m\]\[\e[31m\]\u\[\e[m\]\[\e[33m\]@\[\e[m\]\[\e[32m\]\h\[\e[m\]:\[\e[36m\]\w\[\e[m\]\[\e[32m\]]\[\e[m\]\[\e[36m\]λ \[\e[m\]\[\e[m\]'
export GEM_HOME="$(ruby -e 'puts Gem.user_dir')"
export PATH="$PATH:$GEM_HOME/bin"

. "$HOME/.cargo/env"

