#!/usr/bin/env bash

set -e

VERSION=$1

if [[ -z "$1" ]]; then
  echo "This script needs a VERSION argument, e.g.:"
  echo "$0 8.3"
  exit 1
fi
if [[ ! -d "$HOME/Source" ]]; then
  echo "This script assumes a source directory to be located at $HOME/Source"
  exit 1
fi
if [[ ! -d "$HOME/.local/bin" ]]; then
  echo "This script assumes the following directory to exist and be in your PATH:"
  echo " $HOME/.local/bin/"
  exit 1
fi

# Download & untar
cd "$HOME/Source"
curl -L "https://download.racket-lang.org/installers/$VERSION/racket-$VERSION-src-builtpkgs.tgz" -o "racket-$VERSION.tar"
tar xvf "racket-$VERSION.tar"
rm "racket-$VERSION.tar"

# Compile from source
cd "racket-$VERSION/src"
mkdir -p build
cd build
../configure
make
make install

# "Install" by symlinking
cd "$HOME/Source/racket-$VERSION/bin/"
find . -type f -execdir ln -sf "$(pwd)/{}" "$HOME/.local/bin/{}" \;

# Install commonly used packages
"$HOME/.local/bin/raco" pkg install --auto --skip-installed --installation \
  web-server

"$HOME/.local/bin/raco" pkg install --auto --skip-installed --user \
  racket-langserver \
  threading \
  racketscript \
  rackjure \
  files-viewer \
  beautiful-racket \
  markdown \
  http-easy \
  sha \
  dotenv \
  tzinfo tzdata \
  graph \
  advent-of-code

echo -e "\nDone."
