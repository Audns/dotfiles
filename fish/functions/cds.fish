function cds --description 'Select file with fzf and cd to its directory'
    fd --type f --hidden --exclude .git 2>/dev/null \
        | fzf --prompt="Select file: " --reverse \
        | read -l selected

    if test -n "$selected"
        cd (dirname "$selected")
        commandline -f repaint
    end
end
