# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f $HOME/miniconda3/bin/conda
    eval $HOME/miniconda3/bin/conda "shell.fish" hook $argv | source
else
    if test -f "$HOME/miniconda3/etc/fish/conf.d/conda.fish"
        . "$HOME/miniconda3/etc/fish/conf.d/conda.fish"
    else
        set -x PATH $HOME/miniconda3/bin $PATH
    end
end
# <<< conda initialize <<<

# Set fcitx is the default input method
export XMODIFIERS=@im=fcitx

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

# Set Env
set -gx QT_QPA_PLATFORMTHEME qt5ct
set -x EDITOR helix

# GEMINI_API_KEY
# if command -q pass
#     set -gx GEMINI_API_KEY (pass gemini/api-key)
# end
# set -gx GEMINI_API_KEY (pass gemini/api-key)

# uv
fish_add_path "$HOME/.local/bin"

# Change the cache dir of uv
export UV_CACHE_DIR=$HOME/second/uv-cache

# Export .rustup toolchains
set -x PATH $HOME/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/bin $PATH

# Export go
set -x PATH $HOME/go/bin $PATH
