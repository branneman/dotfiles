export PATH="$PATH:~/.bin/"
export PATH="$PATH:/usr/local/go/bin"
export PATH="~/.cargo/bin:$PATH"

export GOPATH="$HOME/go"

export EDITOR=vi
export LESSCHARSET="utf-8"

if [[ `uname` == 'Darwin' ]]; then
    export HOMEBREW_NO_ANALYTICS=1
fi

if [ -f .env ]; then
    source .env
fi
