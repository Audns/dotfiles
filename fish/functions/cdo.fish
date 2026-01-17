function cdo --description "fzf into a file with improved GUI launching"
    set -l fd_cmd (command -v fdfind; or command -v fd)

    if test -z "$fd_cmd"
        echo "Error: 'fd' or 'fdfind' is not installed."
        return 1
    end

    # set -l file ($fd_cmd --type f --hidden --exclude .git | fzf --preview 'bat --style=numbers --color=always --line-range :500 {} 2>/dev/null || file {}')
    set -l file ($fd_cmd --type f --hidden --exclude .git --exclude .venv --exclude .cache --exclude .cargo --exclude .bun | fzf --reverse)

    if test -n "$file"
        set -l ext (string lower (string split -r -m1 . $file)[-1])

        switch $ext
            # Documents / Code
            case conf txt md py sh fish js json rs cpp c h
                $EDITOR $file

                # PDF
            case pdf
                # Use nohup to fully detach the process from the terminal
                nohup zathura "$file" >/dev/null 2>&1 &

                # Images
            case png jpg jpeg webp gif
                nohup gthumb "$file" >/dev/null 2>&1 &

                # Video
            case mp4 mkv mov avi m4a
                nohup mpv "$file" >/dev/null 2>&1 &

                # Documents
            case docx pptx odt xlsx
                nohup libreoffice "$file" >/dev/null 2>&1 &
                # Fallback
            case '*'
                # nohup xdg-open "$file" >/dev/null 2>&1 &
                $EDITOR $file
        end

        # Refresh the prompt so it doesn't look "stuck"
        commandline -f repaint
    end
end
