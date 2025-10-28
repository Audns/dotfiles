# import local configuration
source $HOME/dotfiles/fish/local.fish

# Remove the greeting prompt
set -U fish_greeting ""

# Initialize starship
starship init fish | source

# Alias
alias cd='z'
alias pparu='proxychains4 -q paru'
alias vmrestart='sudo modprobe -v vmmon; sudo modprobe vmnet; sudo systemctl start vmware-networks.service; sudo systemctl start vmtoolsd.service'
alias cat='bat'
alias ls='eza --color=always --icons=always --group-directories-first'
alias lla='eza --color=always --icons=always -al --group-directories-first'
alias ip='ip -c'
alias grep='rg'
alias hx='helix'
