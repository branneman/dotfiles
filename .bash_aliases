if [[ `uname` == 'Linux' ]]; then
  alias cls="clear"
  elif [[ `uname` == 'Darwin' ]]; then
  alias cls="clear && node -e \"process.stdout.write('\\u001b]1337;ClearScrollback\\u0007')\""
fi

alias l="ls -cl -hp --time-style=long-iso --group-directories-first --color=auto"
alias ll="l -a"

alias cd1="cd .."
alias cd2="cd ../../"
alias cd3="cd ../../../"
alias cd4="cd ../../../../"
alias cd5="cd ../../../../../"

if [[ `uname` == 'Linux' ]]; then
  alias open="xdg-open"
fi
start() { nohup $1 &> /dev/null & disown; }

alias updates='
  echo && sudo true && \
  echo -e "\n> apt update\n" && sudo apt update && \
  echo -e "\n> apt full-upgrade -y\n" && sudo apt full-upgrade -y && \
  echo -e "\n> apt-get clean -y\n" && sudo apt-get clean -y && \
  echo -e "\n> apt-get autoclean -y\n" && sudo apt-get autoclean -y && \
  echo -e "\n> apt-get autoremove -y --purge\n" && sudo apt-get autoremove -y --purge && \
  if [ -x "$(command -v snap)" ]; then echo -e "\n> snap refresh\n" && sudo snap refresh; fi && \
  if [ -x "$(command -v brew)" ]; then echo -e "\n> brew upgrade\n" && brew upgrade; fi'

alias chrome="nohup /usr/bin/google-chrome-stable --remote-debugging-port=9222 &> ~/.chrome.nohup.out & disown"

alias vpn="sudo openvpn --config ${HOME}/.ovpn/${OPENVPN_SERVER} --auth-user-pass ${HOME}/.ovpn/auth.txt"

if [[ `uname` == 'Darwin' ]]; then
  alias showhidden="defaults write com.apple.finder AppleShowAllFiles YES && killall Finder"
  alias hidehidden="defaults write com.apple.finder AppleShowAllFiles NO && killall Finder"
  alias rds="find . -name \"*.DS_Store\" -type f -delete"
fi

alias path='echo -e ${PATH//:/\\n}'

if [[ `uname` == 'Darwin' ]]; then
  alias flushdns='sudo dscacheutil -flushcache ; sudo killall -HUP mDNSResponder'
fi

alias blueprint='export AWS_CONFIG_FILE=~/.aws/config AWS_SHARED_CREDENTIALS_FILE=~/.aws/credentials'
alias legacy='export AWS_CONFIG_FILE=~/.aws_legacy/config AWS_SHARED_CREDENTIALS_FILE=~/.aws_legacy/credentials'

alias k='kubectl'
alias ks='echo -e "context: $(k config current-context)\nnamespace: $(k config view --minify --output jsonpath={..namespace})"'
alias kc='f (){ export KUBECONFIG=~/.kube/"$@".yaml; unset -f f; }; f'
alias kns='f(){ k config set-context --current --namespace="$@"; unset -f f; }; f'
complete -F __start_kubectl k

alias vmlist='VBoxManage list vms'
alias vmstart='VBoxManage startvm --type headless'
vmstop() { VBoxManage controlvm $1 poweroff; }

alias base64-enc="openssl enc -base64"
alias base64-dec="openssl enc -base64 -d"

alias rsa='echo -e "\nEncrypt, Decrypt, Sign and Verify using the OpenSSL RSA util.\n\nYou can use stdin and stdout, or the -in and -out arguments to specify paths.\n\nExamples:\n rsa-enc -inkey key.pub.pem\n rsa-dec -inkey key.pem\n rsa-sign -inkey key.pem\n rsa-verify -inkey key.pem"'
alias rsa-enc="openssl rsautl -encrypt -pubin"   # -inkey key.pub.pem
alias rsa-dec="openssl rsautl -decrypt"          # -inkey key.pem
alias rsa-sign="openssl rsautl -sign"            # -inkey key.pem
alias rsa-verify="openssl rsautl -verify"        # -inkey key.pem
