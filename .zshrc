#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

zstyle ':prezto:module:prompt' theme 'paradox'

#This is to avoid the problem with sdkman
set +o noclobber

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/amir/.sdkman"
[[ -s "/Users/amir/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/amir/.sdkman/bin/sdkman-init.sh"

#This is very slow
export NVM_DIR="$HOME/.nvm"
#. "/usr/local/opt/nvm/nvm.sh"

#for pyenv to work
export PATH=$(brew --prefix openssl)/bin:$PATH
export CFLAGS="-I$(brew --prefix openssl)/include" 
export LDFLAGS="-L$(brew --prefix openssl)/lib" 

. /usr/local/etc/profile.d/z.sh

eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
export PATH="/Users/amir/.local/bin:$PATH"
#export PATH="/Users/amir/.stack/snapshots/x86_64-osx/lts-9.14/8.0.2/bin:/Users/amir/.stack/programs/x86_64-osx/ghc-8.0.2/bin:$PATH"
#export PATH ="/Users/amir/.local/bin:$PATH"

eval "$(rbenv init -)"

source /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh
#nix-shell -p figlet -p lolcat --run "echo 'nix rules' | figlet | lolcat (you can alternatively call this one)

set -o vi

#mkdir -p ~/Library/LaunchAgents
#cp /Users/amir/.pyenv/versions/anaconda3-5.0.0/envs/anatest/org.freedesktop.dbus-session.plist ~/Library/LaunchAgents/
#launchctl load -w ~/Library/LaunchAgents/org.freedesktop.dbus-session.plist

alias tens="docker run -v /Users/amir/projects/tensorflowplayground/TensorFlow-LiveLessons:/home/jovyan/work -it --rm -p 8888:8888 tensorflow-ll-stack"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
.  /usr/local/etc/bash_completion.d
source ~/.iterm2_shell_integration.bash

