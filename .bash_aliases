alias l="ls -cl -hp --time-style=long-iso --group-directories-first --color=auto"
alias ll="l -a"

alias cd1="cd .."
alias cd2="cd ../../"
alias cd3="cd ../../../"
alias cd4="cd ../../../../"
alias cd5="cd ../../../../../"

alias open="xdg-open"
start() { nohup $1 &> /dev/null & disown; }

alias path='echo -e ${PATH//:/\\n}'

alias k='kubectl'
alias ks='echo -e "context: $(k config current-context)\nnamespace: $(k config view --minify --output jsonpath={..namespace})"'
alias kc='f (){ export KUBECONFIG=~/.kube/"$@".yaml; unset -f f; }; f'
alias kns='f(){ k config set-context --current --namespace="$@"; unset -f f; }; f'
complete -F __start_kubectl k
