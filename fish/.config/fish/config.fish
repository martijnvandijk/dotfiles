alias t=task
export EDITOR=vim
gpg-agent --daemon
if not set -q SSH_AUTH_SOCK
#        export SSH_AUTH_SOCK=$HOME/.gnupg/S.gpg-agent.ssh
	export SSH_AUTH_SOCK=/run/user/1000/gnupg/S.gpg-agent.ssh
end
export PUUSH_API_KEY="188EF7BAAF5A95F154A51CAF37A1B702"
export SSH_AUTH_SOCK=/run/user/1000/gnupg/S.gpg-agent.ssh
set -gx PATH /usr/bin/vendor_perl  $PATH
set -gx PATH ~/bin $PATH
set -gx PATH ~/.gocode/bin $PATH
export GOPATH="$HOME/.gocode"
