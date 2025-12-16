# import local configuration
source $HOME/dotfiles/fish/local.fish

# Remove the greeting prompt
set -u fish_greeting ""

# Initialize starship
starship init fish | source

# Env
set -gx XMODIFIERS @im=fcitx
export EDITOR=helix

# Alias
alias pparu='proxychains4 -q paru'
alias vmrestart='sudo modprobe -v vmmon; sudo modprobe vmnet; sudo systemctl start vmware-networks.service; sudo systemctl start vmtoolsd.service'
alias ls='eza --color=always --icons=always --group-directories-first'
alias ip='ip -c'
alias hx='helix'
alias cd='z'

# Binding
bind \ex prepend_proxychains4
bind \eh 'commandline "helix ."; commandline -f execute'
bind \et 'commandline "tmux"; commandline -f execute'
