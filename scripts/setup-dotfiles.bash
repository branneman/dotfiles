#!/bin/bash

if ! [ -x "$(command -v git)" ]; then
  if [ -x "$(command -v apt-get)" ]; then
    apt-get update
    apt-get install git -y
  fi
  if ! [ -x "$(command -v git)" ]; then
    printf "\nThis script requires git!\n"
    exit 1
  fi
fi

git clone https://github.com/branneman/dotfiles.git ~/dotfiles

symlink() {
  if [ -e ~/$1 ]; then
    echo "Found existing file, created backup: ~/${1}.bak"
    mv ~/$1 ~/$1.bak
  fi
  ln -sf ~/dotfiles/$1 ~/$1;
}

symlink .profile
symlink .bash_profile
symlink .bashrc

symlink .bash_aliases
symlink .bash_prompt
symlink .inputrc

symlink .emacs
symlink .gitconfig
symlink .gitignore
symlink .gitcompletion.bash
symlink .kubecompletion.bash
symlink .curlrc
symlink .nvmrc
symlink .hyper.js
symlink .tmux.conf
symlink .XCompose

echo "Enter Git fullname:"
read GIT_FULLNAME
echo "Requesting root permissions to set git config at system level..."
sudo git config --system user.name $FULLNAME
echo "Success."

echo "Enter Git email address:"
read GIT_EMAIL
echo "Requesting root permissions to set git config at system level..."
sudo git config --system user.email $GIT_EMAIL
echo "Success."

exec $BASH
