if [[ $OSTYPE == 'darwin'* ]]; then
  alias l="ls -cl -hp --color=always"
else
  alias l="ls -cl -hp --time-style=long-iso --group-directories-first --color=always"
fi
alias ll="l -a"

alias cd1="cd .."
alias cd2="cd ../../"
alias cd3="cd ../../../"
alias cd4="cd ../../../../"
alias cd5="cd ../../../../../"

if [[ $OSTYPE != 'darwin'* ]]; then
  alias open="xdg-open"
fi
start() { nohup $1 &> /dev/null & disown; }

alias tree='tree -I ".git|node_modules"'

alias path='echo -e ${PATH//:/\\n}'

alias k='kubectl'
alias ks='echo -e "context: $(k config current-context)\nnamespace: $(k config view --minify --output jsonpath={..namespace})"'
alias kc='f (){ export KUBECONFIG=~/.kube/"$@".yaml; unset -f f; }; f'
alias kns='f(){ k config set-context --current --namespace="$@"; unset -f f; }; f'
complete -F __start_kubectl k
