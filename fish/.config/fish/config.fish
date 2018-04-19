# set variables
export EDITOR=nvim

# configure aliases
alias vim=nvim

# configure gpg-agentn SSH auth
gpg-connect-agent /bye
if test -e ~/.gpg-ssh
    export SSH_AUTH_SOCK={$XDG_RUNTIME_DIR}/gnupg/S.gpg-agent.ssh
end 

# configure PATH
set -gx PATH ~/bin $PATH

if test -d ~/.gocode/bin
    set -gx PATH ~/.gocode/bin $PATH
    export GOPATH="$HOME/.gocode"
end

