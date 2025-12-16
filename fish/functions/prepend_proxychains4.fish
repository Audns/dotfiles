function prepend_proxychains4
    set -l cmd (commandline)
    if test -n "$cmd"
        # Check if command already starts with "proxychains4 -q "
        if string match -q "proxychains4 -q *" -- $cmd
            # Remove "proxychains4 -q " from the beginning
            set -l new_cmd (string replace -r "^proxychains4 -q " "" -- $cmd)
            commandline -r $new_cmd
        else
            # Add "proxychains4 -q " to the beginning
            commandline -r "proxychains4 -q $cmd"
        end
    end
end
