function copy_and_clear_commandline
    # Copy current command line to clipboard using fish's built-in
    commandline | fish_clipboard_copy
    # Clear the command line using kill-whole-line to add to kill ring
    commandline -f kill-whole-line
end