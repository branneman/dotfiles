alias l="ls -slAchG"

alias ws="open -a /Applications/WebStorm.app"
alias rds="find . -name \"*.DS_Store\" -type f -delete"

alias path="echo -e ${PATH//:/\\n}"

alias enc="openssl rsautl -sign -inkey ~/.ssh/id_rsa"   # add: -in plain.txt -out encrypted.txt
alias dec="openssl rsautl -verify -inkey ~/.ssh/id_rsa" # add: -in encrypted.txt -out decrypted.txt

alias cd1="cd .."
alias cd2="cd ../../"
alias cd3="cd ../../../"
alias cd4="cd ../../../../"
alias cd5="cd ../../../../../"
