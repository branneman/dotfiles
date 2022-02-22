#!/usr/bin/env bash

set -e

VERSION=$1

if [[ -z "$1" ]]; then
  echo "This script needs a VERSION argument, e.g.:"
  echo "$0 8.3"
  exit 1
fi
if [[ ! -d "$HOME/Source" ]]; then
  echo "This script assumes a source directory to be located at ~/Source"
  exit 1
fi
if [[ ! -d "$HOME/.local/bin" ]]; then
  echo "This script assumes the following directory to exist and be in your PATH:"
  echo " ~/.local/bin/"
  exit 1
fi
if [[ ! -d "$HOME/Source/racket-$VERSION/bin" ]]; then
  echo "Racket v$VERSION not found!"
  echo "Install with:"
  echo " ~/dotfiles/install-racket.bash $VERSION"
  exit 1
fi

# "Install" by symlinking
cd "$HOME/Source/racket-$VERSION/bin/"
find . -type f -execdir ln -sf "$(pwd)/{}" "$HOME/.local/bin/{}" \;
echo -e "\nSymlinking ~/Source/racket-$VERSION to ~/.local/bin\n"

racket -v
