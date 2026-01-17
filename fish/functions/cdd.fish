function cdd --description 'Find and cd to file directory using fd and fzf'
    # Check if search pattern is provided
    if test (count $argv) -eq 0
        echo "Usage: cdd <search_pattern>"
        return 1
    end

    # Search for files using fd
    set -l results (fd --type f --hidden --exclude .git $argv[1])

    # Check number of results
    set -l result_count (count $results)

    switch $result_count
        case 0
            echo "No files found matching: $argv[1]"
            return 1

        case 1
            # Single result - cd directly
            set -l target_dir (dirname $results[1])
            cd $target_dir
            and echo "Changed to: $target_dir"

        case '*'
            # Multiple results - use fzf to select
            set -l selected (printf '%s\n' $results | fzf --prompt="Select file: " --height=40% --reverse)

            if test -n "$selected"
                set -l target_dir (dirname $selected)
                cd $target_dir
                and echo "Changed to: $target_dir"
            else
                echo "No selection made"
                return 1
            end
    end
end
