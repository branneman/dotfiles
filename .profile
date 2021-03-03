export HISTSIZE=1000000
export HISTFILESIZE=1000000000

export EDITOR="emacs -nw"
export LESSCHARSET="utf-8"

export GTK_IM_MODULE=xim

if [ -d "$HOME/.bin" ]; then
  export PATH="$PATH:$HOME/.bin"
fi

if [ -d "/home/linuxbrew" ]; then
  export PATH="$PATH:/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin"
  export HOMEBREW_PREFIX="/home/linuxbrew/.linuxbrew"
  export HOMEBREW_CELLAR="/home/linuxbrew/.linuxbrew/Cellar"
  export HOMEBREW_REPOSITORY="/home/linuxbrew/.linuxbrew/Homebrew"
  export MANPATH="/home/linuxbrew/.linuxbrew/share/man:$MANPATH"
  export INFOPATH="/home/linuxbrew/.linuxbrew/share/info:$INFOPATH"
fi

if [ -d "$HOME/.cargo" ]; then
  export PATH="$HOME/.cargo/bin:$PATH"
fi

if [[ `uname` == 'Darwin' ]]; then
  export HOMEBREW_NO_ANALYTICS=1
fi

if [ -f .env ]; then
  source .env
fi
