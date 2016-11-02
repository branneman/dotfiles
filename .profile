export EDITOR=emacs

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

if [ -f .rsvm/rsvm.sh ]; then
    source .rsvm/rsvm.sh
    export PATH="$PATH:/Users/bvandermeer/.cargo/bin"
fi

export NVM_DIR="/Users/bvandermeer/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

nvm use 6.9.1

