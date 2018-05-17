alias aliases="cat ~/.bash_aliases | sed -e 's/alias //' -e 's/=\"/ = /' -e 's/\"$//'"

alias cls="clear && node -e \"process.stdout.write('\\u001b]1337;ClearScrollback\\u0007')\""
alias l="ls -slAchG"

alias cd1="cd .."
alias cd2="cd ../../"
alias cd3="cd ../../../"
alias cd4="cd ../../../../"
alias cd5="cd ../../../../../"

alias showhidden="defaults write com.apple.finder AppleShowAllFiles YES && killall Finder"
alias hidehidden="defaults write com.apple.finder AppleShowAllFiles NO && killall Finder"
alias rds="find . -name \"*.DS_Store\" -type f -delete"

alias path='echo -e ${PATH//:/\\n}'
alias flushdns='sudo dscacheutil -flushcache ; sudo killall -HUP mDNSResponder'

alias base64-enc="openssl enc -base64"
alias base64-dec="openssl enc -base64 -d"

alias gzip-enc=""
alias gzip-dec=""

alias deflate-enc="pigz"
alias deflate-dec="pigz - d"

alias zlib-enc="openssl enc -z -none -e"
alias zlib-dec="openssl enc -z -none -d"

alias rsa='echo -e "\nEncrypt, Decrypt, Sign and Verify using the OpenSSL RSA util.\n\nYou can use stdin and stdout, or the -in and -out arguments to specify paths.\n\nExamples:\n rsa-enc -inkey key.pub.pem\n rsa-dec -inkey key.pem\n rsa-sign -inkey key.pem\n rsa-verify -inkey key.pem"'
alias rsa-enc="openssl rsautl -encrypt -pubin"   # -inkey key.pub.pem
alias rsa-dec="openssl rsautl -decrypt"          # -inkey key.pem
alias rsa-sign="openssl rsautl -sign"            # -inkey key.pem
alias rsa-verify="openssl rsautl -verify"        # -inkey key.pem
