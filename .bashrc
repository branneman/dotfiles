if [ -f "$HOME/.bash_aliases" ]; then
  source "$HOME/.bash_aliases"
fi

if [ -f "$HOME/.bash_prompt" ]; then
  source "$HOME/.bash_prompt"
fi

if [ -f "$HOME/.gitcompletion.bash" ]; then
  source "$HOME/.gitcompletion.bash"
fi

if [ -f "$HOME/.kubecompletion.bash" ]; then
  source "$HOME/.kubecompletion.bash"
fi

if [ -f "/usr/local/bin/aws_completer" ]; then
  complete -C '/usr/local/bin/aws_completer' aws
fi

if [ -f "/usr/bin/kubectl" ]; then
  kubectl completion bash | bash
fi

# Node.js version manager
if [ -d "$HOME/.nvm" ]; then
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
  if [ -f .nvmrc ]; then
    nvm use
  else
    nvm use default
  fi
fi

# Python version manager
if [ -d "$HOME/.pyenv" ]; then
  eval "$(pyenv init -)"
fi

# Java version manager
if [ -d "$HOME/.jabba" ]; then
  source "$HOME/.jabba/jabba.sh"
  jabba use openjdk@1.14.0
fi
