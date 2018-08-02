export PATH=$PATH:~/.bin/

export EDITOR=vim
export LANG="en_US.UTF-8"
export LESSCHARSET="utf-8"

if [ -f .env ]; then
    source .env
fi

if [ -f .bash_aliases ]; then
    source .bash_aliases
fi

if [ -f .bash_prompt ]; then
    source .bash_prompt
fi

if [ -f git-completion.bash ]; then
    source git-completion.bash
fi

if [ -f /usr/local/bin/aws_completer ]; then
    complete -C '/usr/local/bin/aws_completer' aws
fi

# Node.js version manager
if [ -d .nvm ]; then
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
    nvm use stable
fi

# Java version manager
if [ -d .jenv ]; then
    export PATH="$HOME/.jenv/bin:$PATH"
    eval "$(jenv init -)"
fi

export HOMEBREW_NO_ANALYTICS=1
