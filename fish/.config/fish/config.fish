# Path to Oh My Fish install.
set -gx OMF_PATH $HOME/".local/share/omf"

# Customize Oh My Fish configuration path.
#set -gx OMF_CONFIG $HOME/".config/omf"

# Load oh-my-fish configuration.
source $OMF_PATH/init.fish

set -g theme_display_user yes

alias texclean="rm *.fls *.aux *.out *.log *.fdb_latexmk *.ilg *.idx *.synctex.gz *.toc *.ind"

export EDITOR=vim

# Start gpg-agent if it is not running
gpg-connect-agent /bye

# Set up GPG agent SSH auth
if not set -q SSH_AUTH_SOCK
        export SSH_AUTH_SOCK=$HOME/.gnupg/S.gpg-agent.ssh
end

set -x GOPATH $HOME/.gocode

set PATH $HOME"/.gocode/bin" /usr/bin/core_perl/ $HOME/"bin/" (ruby -rubygems -e "puts Gem.user_dir") $PATH

