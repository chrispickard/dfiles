# Print an optspec for argparse to handle cmd's options that are independent of any subcommand.
function __fish_jj_global_optspecs
    string join \n R/repository= ignore-working-copy no-integrate-operation ignore-immutable at-operation= debug color= quiet no-pager config= config-file= h/help V/version
end

function __fish_jj_needs_command
    # Figure out if the current invocation already has a command.
    set -l cmd (commandline -opc)
    set -e cmd[1]
    argparse -s (__fish_jj_global_optspecs) -- $cmd 2>/dev/null
    or return
    if set -q argv[1]
        # Also print the command, so this can be used to figure out what it is.
        echo $argv[1]
        return 1
    end
    return 0
end

function __fish_jj_using_subcommand
    set -l cmd (__fish_jj_needs_command)
    test -z "$cmd"
    and return 1
    contains -- $cmd[1] $argv
end

complete -c jj -n "__fish_jj_needs_command" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_needs_command" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_needs_command" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_needs_command" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_needs_command" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_needs_command" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_needs_command" -l no-integrate-operation -d 'Run the command as usual but don\'t integrate any operations'
complete -c jj -n "__fish_jj_needs_command" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_needs_command" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_needs_command" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_needs_command" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_needs_command" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_needs_command" -s V -l version -d 'Print version'
complete -c jj -n "__fish_jj_needs_command" -f -a "abandon" -d 'Abandon a revision'
complete -c jj -n "__fish_jj_needs_command" -f -a "absorb" -d 'Move changes from a revision into the stack of mutable revisions'
complete -c jj -n "__fish_jj_needs_command" -f -a "arrange" -d 'Interactively arrange the commit graph'
complete -c jj -n "__fish_jj_needs_command" -f -a "bisect" -d 'Find a bad revision by bisection'
complete -c jj -n "__fish_jj_needs_command" -f -a "bookmark" -d 'Manage bookmarks [default alias: b]'
complete -c jj -n "__fish_jj_needs_command" -f -a "commit" -d 'Update the description and create a new change on top [default alias: ci]'
complete -c jj -n "__fish_jj_needs_command" -f -a "config" -d 'Manage config options'
complete -c jj -n "__fish_jj_needs_command" -f -a "converge" -d 'Converge divergent changes'
complete -c jj -n "__fish_jj_needs_command" -f -a "debug" -d 'Low-level commands not intended for users'
complete -c jj -n "__fish_jj_needs_command" -f -a "describe" -d 'Update the change description or other metadata [default alias: desc]'
complete -c jj -n "__fish_jj_needs_command" -f -a "diff" -d 'Compare file contents between two revisions'
complete -c jj -n "__fish_jj_needs_command" -f -a "diffedit" -d 'Touch up the content changes in a revision with a diff editor'
complete -c jj -n "__fish_jj_needs_command" -f -a "duplicate" -d 'Create new changes with the same content as existing ones'
complete -c jj -n "__fish_jj_needs_command" -f -a "edit" -d 'Sets the specified revision as the working-copy revision'
complete -c jj -n "__fish_jj_needs_command" -f -a "evolog" -d 'Show how a change has evolved over time'
complete -c jj -n "__fish_jj_needs_command" -f -a "evolution-log" -d 'Show how a change has evolved over time'
complete -c jj -n "__fish_jj_needs_command" -f -a "file" -d 'File operations'
complete -c jj -n "__fish_jj_needs_command" -f -a "fix" -d 'Update files with formatting fixes or other changes'
complete -c jj -n "__fish_jj_needs_command" -f -a "gerrit" -d 'Interact with Gerrit Code Review'
complete -c jj -n "__fish_jj_needs_command" -f -a "git" -d 'Commands for working with Git remotes and the underlying Git repo'
complete -c jj -n "__fish_jj_needs_command" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c jj -n "__fish_jj_needs_command" -f -a "interdiff" -d 'Show differences between the diffs of two revisions'
complete -c jj -n "__fish_jj_needs_command" -f -a "log" -d 'Show revision history'
complete -c jj -n "__fish_jj_needs_command" -f -a "metaedit" -d 'Modify the metadata of a revision without changing its content'
complete -c jj -n "__fish_jj_needs_command" -f -a "new" -d 'Create a new, empty change and (by default) edit it in the working copy'
complete -c jj -n "__fish_jj_needs_command" -f -a "next" -d 'Move the working-copy commit to the child revision'
complete -c jj -n "__fish_jj_needs_command" -f -a "operation" -d 'Commands for working with the operation log'
complete -c jj -n "__fish_jj_needs_command" -f -a "op" -d 'Commands for working with the operation log'
complete -c jj -n "__fish_jj_needs_command" -f -a "parallelize" -d 'Parallelize revisions by making them siblings'
complete -c jj -n "__fish_jj_needs_command" -f -a "prev" -d 'Change the working copy revision relative to the parent revision'
complete -c jj -n "__fish_jj_needs_command" -f -a "rebase" -d 'Move revisions to different parent(s)'
complete -c jj -n "__fish_jj_needs_command" -f -a "redo" -d 'Redo the most recently undone operation'
complete -c jj -n "__fish_jj_needs_command" -f -a "resolve" -d 'Resolve conflicted files with an external merge tool'
complete -c jj -n "__fish_jj_needs_command" -f -a "restore" -d 'Restore paths from another revision'
complete -c jj -n "__fish_jj_needs_command" -f -a "revert" -d 'Apply the reverse of the given revision(s)'
complete -c jj -n "__fish_jj_needs_command" -f -a "root" -d 'Show the current workspace root directory (shortcut for `jj workspace root`)'
complete -c jj -n "__fish_jj_needs_command" -f -a "run" -d 'Run a command across a set of revisions.'
complete -c jj -n "__fish_jj_needs_command" -f -a "show" -d 'Show revision metadata and diff'
complete -c jj -n "__fish_jj_needs_command" -f -a "sign" -d 'Cryptographically sign a revision'
complete -c jj -n "__fish_jj_needs_command" -f -a "simplify-parents" -d 'Simplify parent edges for the specified revision(s)'
complete -c jj -n "__fish_jj_needs_command" -f -a "sparse" -d 'Manage which paths from the working-copy commit are present in the working copy'
complete -c jj -n "__fish_jj_needs_command" -f -a "split" -d 'Split a revision in two'
complete -c jj -n "__fish_jj_needs_command" -f -a "squash" -d 'Move changes from a revision into another revision'
complete -c jj -n "__fish_jj_needs_command" -f -a "status" -d 'Show high-level repo status [default alias: st]'
complete -c jj -n "__fish_jj_needs_command" -f -a "tag" -d 'Manage tags'
complete -c jj -n "__fish_jj_needs_command" -f -a "undo" -d 'Undo the last operation'
complete -c jj -n "__fish_jj_needs_command" -f -a "unsign" -d 'Drop a cryptographic signature'
complete -c jj -n "__fish_jj_needs_command" -f -a "util" -d 'Infrequently used commands such as for generating shell completions'
complete -c jj -n "__fish_jj_needs_command" -f -a "version" -d 'Display version information'
complete -c jj -n "__fish_jj_needs_command" -f -a "workspace" -d 'Commands for working with workspaces'
complete -c jj -n "__fish_jj_using_subcommand abandon" -s r -r
complete -c jj -n "__fish_jj_using_subcommand abandon" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand abandon" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand abandon" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand abandon" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand abandon" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand abandon" -l retain-bookmarks -d 'Do not delete bookmarks pointing to the revisions to abandon'
complete -c jj -n "__fish_jj_using_subcommand abandon" -l restore-descendants -d 'Do not modify the content of the children of the abandoned commits'
complete -c jj -n "__fish_jj_using_subcommand abandon" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand abandon" -l no-integrate-operation -d 'Run the command as usual but don\'t integrate any operations'
complete -c jj -n "__fish_jj_using_subcommand abandon" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand abandon" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand abandon" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand abandon" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand abandon" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand absorb" -s f -l from -d 'Source revision to absorb from' -r
complete -c jj -n "__fish_jj_using_subcommand absorb" -s t -l into -l to -d 'Destination revisions to absorb into' -r
complete -c jj -n "__fish_jj_using_subcommand absorb" -l tool -d 'Specify diff editor to be used (implies --interactive)' -r
complete -c jj -n "__fish_jj_using_subcommand absorb" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand absorb" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand absorb" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand absorb" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand absorb" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand absorb" -s i -l interactive -d 'Interactively choose which parts to absorb'
complete -c jj -n "__fish_jj_using_subcommand absorb" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand absorb" -l no-integrate-operation -d 'Run the command as usual but don\'t integrate any operations'
complete -c jj -n "__fish_jj_using_subcommand absorb" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand absorb" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand absorb" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand absorb" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand absorb" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand arrange" -s r -r
complete -c jj -n "__fish_jj_using_subcommand arrange" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand arrange" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand arrange" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand arrange" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand arrange" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand arrange" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand arrange" -l no-integrate-operation -d 'Run the command as usual but don\'t integrate any operations'
complete -c jj -n "__fish_jj_using_subcommand arrange" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand arrange" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand arrange" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand arrange" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand arrange" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand bisect; and not __fish_seen_subcommand_from run" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand bisect; and not __fish_seen_subcommand_from run" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand bisect; and not __fish_seen_subcommand_from run" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand bisect; and not __fish_seen_subcommand_from run" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand bisect; and not __fish_seen_subcommand_from run" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand bisect; and not __fish_seen_subcommand_from run" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand bisect; and not __fish_seen_subcommand_from run" -l no-integrate-operation -d 'Run the command as usual but don\'t integrate any operations'
complete -c jj -n "__fish_jj_using_subcommand bisect; and not __fish_seen_subcommand_from run" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand bisect; and not __fish_seen_subcommand_from run" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand bisect; and not __fish_seen_subcommand_from run" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand bisect; and not __fish_seen_subcommand_from run" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand bisect; and not __fish_seen_subcommand_from run" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand bisect; and not __fish_seen_subcommand_from run" -f -a "run" -d 'Run a given command to find the first bad revision'
complete -c jj -n "__fish_jj_using_subcommand bisect; and __fish_seen_subcommand_from run" -s r -l range -d 'Range of revisions to bisect (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand bisect; and __fish_seen_subcommand_from run" -l command -d 'Deprecated. Use positional arguments instead' -r
complete -c jj -n "__fish_jj_using_subcommand bisect; and __fish_seen_subcommand_from run" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand bisect; and __fish_seen_subcommand_from run" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand bisect; and __fish_seen_subcommand_from run" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand bisect; and __fish_seen_subcommand_from run" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand bisect; and __fish_seen_subcommand_from run" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand bisect; and __fish_seen_subcommand_from run" -l find-good -d 'Find the first good revision instead'
complete -c jj -n "__fish_jj_using_subcommand bisect; and __fish_seen_subcommand_from run" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand bisect; and __fish_seen_subcommand_from run" -l no-integrate-operation -d 'Run the command as usual but don\'t integrate any operations'
complete -c jj -n "__fish_jj_using_subcommand bisect; and __fish_seen_subcommand_from run" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand bisect; and __fish_seen_subcommand_from run" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand bisect; and __fish_seen_subcommand_from run" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand bisect; and __fish_seen_subcommand_from run" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand bisect; and __fish_seen_subcommand_from run" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and not __fish_seen_subcommand_from advance a create c delete d forget f list l move m rename r set s track t untrack" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand bookmark; and not __fish_seen_subcommand_from advance a create c delete d forget f list l move m rename r set s track t untrack" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand bookmark; and not __fish_seen_subcommand_from advance a create c delete d forget f list l move m rename r set s track t untrack" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand bookmark; and not __fish_seen_subcommand_from advance a create c delete d forget f list l move m rename r set s track t untrack" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand bookmark; and not __fish_seen_subcommand_from advance a create c delete d forget f list l move m rename r set s track t untrack" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand bookmark; and not __fish_seen_subcommand_from advance a create c delete d forget f list l move m rename r set s track t untrack" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and not __fish_seen_subcommand_from advance a create c delete d forget f list l move m rename r set s track t untrack" -l no-integrate-operation -d 'Run the command as usual but don\'t integrate any operations'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and not __fish_seen_subcommand_from advance a create c delete d forget f list l move m rename r set s track t untrack" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and not __fish_seen_subcommand_from advance a create c delete d forget f list l move m rename r set s track t untrack" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and not __fish_seen_subcommand_from advance a create c delete d forget f list l move m rename r set s track t untrack" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and not __fish_seen_subcommand_from advance a create c delete d forget f list l move m rename r set s track t untrack" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and not __fish_seen_subcommand_from advance a create c delete d forget f list l move m rename r set s track t untrack" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and not __fish_seen_subcommand_from advance a create c delete d forget f list l move m rename r set s track t untrack" -f -a "advance" -d 'Advance the closest bookmarks to a target revision'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and not __fish_seen_subcommand_from advance a create c delete d forget f list l move m rename r set s track t untrack" -f -a "a" -d 'Advance the closest bookmarks to a target revision'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and not __fish_seen_subcommand_from advance a create c delete d forget f list l move m rename r set s track t untrack" -f -a "create" -d 'Create a new bookmark'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and not __fish_seen_subcommand_from advance a create c delete d forget f list l move m rename r set s track t untrack" -f -a "c" -d 'Create a new bookmark'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and not __fish_seen_subcommand_from advance a create c delete d forget f list l move m rename r set s track t untrack" -f -a "delete" -d 'Delete an existing bookmark and propagate the deletion to remotes on the next push'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and not __fish_seen_subcommand_from advance a create c delete d forget f list l move m rename r set s track t untrack" -f -a "d" -d 'Delete an existing bookmark and propagate the deletion to remotes on the next push'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and not __fish_seen_subcommand_from advance a create c delete d forget f list l move m rename r set s track t untrack" -f -a "forget" -d 'Forget a bookmark without marking it as a deletion to be pushed'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and not __fish_seen_subcommand_from advance a create c delete d forget f list l move m rename r set s track t untrack" -f -a "f" -d 'Forget a bookmark without marking it as a deletion to be pushed'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and not __fish_seen_subcommand_from advance a create c delete d forget f list l move m rename r set s track t untrack" -f -a "list" -d 'List bookmarks and their targets'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and not __fish_seen_subcommand_from advance a create c delete d forget f list l move m rename r set s track t untrack" -f -a "l" -d 'List bookmarks and their targets'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and not __fish_seen_subcommand_from advance a create c delete d forget f list l move m rename r set s track t untrack" -f -a "move" -d 'Move existing bookmarks to target revision'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and not __fish_seen_subcommand_from advance a create c delete d forget f list l move m rename r set s track t untrack" -f -a "m" -d 'Move existing bookmarks to target revision'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and not __fish_seen_subcommand_from advance a create c delete d forget f list l move m rename r set s track t untrack" -f -a "rename" -d 'Rename `old` bookmark name to `new` bookmark name'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and not __fish_seen_subcommand_from advance a create c delete d forget f list l move m rename r set s track t untrack" -f -a "r" -d 'Rename `old` bookmark name to `new` bookmark name'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and not __fish_seen_subcommand_from advance a create c delete d forget f list l move m rename r set s track t untrack" -f -a "set" -d 'Create a new bookmark, or update an existing one by name'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and not __fish_seen_subcommand_from advance a create c delete d forget f list l move m rename r set s track t untrack" -f -a "s" -d 'Create a new bookmark, or update an existing one by name'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and not __fish_seen_subcommand_from advance a create c delete d forget f list l move m rename r set s track t untrack" -f -a "track" -d 'Start tracking given remote bookmarks'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and not __fish_seen_subcommand_from advance a create c delete d forget f list l move m rename r set s track t untrack" -f -a "t" -d 'Start tracking given remote bookmarks'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and not __fish_seen_subcommand_from advance a create c delete d forget f list l move m rename r set s track t untrack" -f -a "untrack" -d 'Stop tracking given remote bookmarks'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from advance" -s t -l to -d 'Move bookmarks to this revision' -r
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from advance" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from advance" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from advance" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from advance" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from advance" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from advance" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from advance" -l no-integrate-operation -d 'Run the command as usual but don\'t integrate any operations'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from advance" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from advance" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from advance" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from advance" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from advance" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from a" -s t -l to -d 'Move bookmarks to this revision' -r
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from a" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from a" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from a" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from a" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from a" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from a" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from a" -l no-integrate-operation -d 'Run the command as usual but don\'t integrate any operations'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from a" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from a" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from a" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from a" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from a" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from create" -s r -l revision -l to -d 'The bookmark\'s target revision' -r
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from create" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from create" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from create" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from create" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from create" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from create" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from create" -l no-integrate-operation -d 'Run the command as usual but don\'t integrate any operations'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from create" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from create" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from create" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from create" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from create" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from c" -s r -l revision -l to -d 'The bookmark\'s target revision' -r
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from c" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from c" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from c" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from c" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from c" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from c" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from c" -l no-integrate-operation -d 'Run the command as usual but don\'t integrate any operations'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from c" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from c" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from c" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from c" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from c" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from delete" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from delete" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from delete" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from delete" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from delete" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from delete" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from delete" -l no-integrate-operation -d 'Run the command as usual but don\'t integrate any operations'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from delete" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from delete" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from delete" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from delete" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from delete" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from d" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from d" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from d" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from d" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from d" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from d" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from d" -l no-integrate-operation -d 'Run the command as usual but don\'t integrate any operations'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from d" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from d" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from d" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from d" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from d" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from forget" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from forget" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from forget" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from forget" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from forget" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from forget" -l include-remotes -d 'When forgetting a local bookmark, also forget any corresponding remote bookmarks'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from forget" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from forget" -l no-integrate-operation -d 'Run the command as usual but don\'t integrate any operations'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from forget" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from forget" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from forget" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from forget" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from forget" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from f" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from f" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from f" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from f" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from f" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from f" -l include-remotes -d 'When forgetting a local bookmark, also forget any corresponding remote bookmarks'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from f" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from f" -l no-integrate-operation -d 'Run the command as usual but don\'t integrate any operations'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from f" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from f" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from f" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from f" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from f" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from list" -l remote -d 'Show all tracked and untracked remote bookmarks belonging to this remote' -r
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from list" -s r -l revision -d 'Show bookmarks whose local targets are in the given revisions' -r
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from list" -s T -l template -d 'Render each bookmark using the given template' -r
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from list" -l sort -d 'Sort bookmarks based on the given key (or multiple keys)' -r -f -a "name\t''
name-\t''
author-name\t''
author-name-\t''
author-email\t''
author-email-\t''
author-date\t''
author-date-\t''
committer-name\t''
committer-name-\t''
committer-email\t''
committer-email-\t''
committer-date\t''
committer-date-\t''"
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from list" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from list" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from list" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from list" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from list" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from list" -s a -l all-remotes -d 'Show all tracked and untracked remote bookmarks including the ones whose targets are synchronized with the local bookmarks'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from list" -s t -l tracked -d 'Show tracked remote bookmarks only'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from list" -s c -l conflicted -d 'Show conflicted bookmarks only'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from list" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from list" -l no-integrate-operation -d 'Run the command as usual but don\'t integrate any operations'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from list" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from list" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from list" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from list" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from list" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from l" -l remote -d 'Show all tracked and untracked remote bookmarks belonging to this remote' -r
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from l" -s r -l revision -d 'Show bookmarks whose local targets are in the given revisions' -r
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from l" -s T -l template -d 'Render each bookmark using the given template' -r
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from l" -l sort -d 'Sort bookmarks based on the given key (or multiple keys)' -r -f -a "name\t''
name-\t''
author-name\t''
author-name-\t''
author-email\t''
author-email-\t''
author-date\t''
author-date-\t''
committer-name\t''
committer-name-\t''
committer-email\t''
committer-email-\t''
committer-date\t''
committer-date-\t''"
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from l" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from l" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from l" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from l" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from l" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from l" -s a -l all-remotes -d 'Show all tracked and untracked remote bookmarks including the ones whose targets are synchronized with the local bookmarks'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from l" -s t -l tracked -d 'Show tracked remote bookmarks only'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from l" -s c -l conflicted -d 'Show conflicted bookmarks only'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from l" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from l" -l no-integrate-operation -d 'Run the command as usual but don\'t integrate any operations'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from l" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from l" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from l" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from l" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from l" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from move" -s f -l from -d 'Move bookmarks from the given revisions' -r
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from move" -s t -l to -d 'Move bookmarks to this revision' -r
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from move" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from move" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from move" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from move" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from move" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from move" -s B -l allow-backwards -d 'Allow moving bookmarks backwards or sideways'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from move" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from move" -l no-integrate-operation -d 'Run the command as usual but don\'t integrate any operations'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from move" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from move" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from move" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from move" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from move" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from m" -s f -l from -d 'Move bookmarks from the given revisions' -r
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from m" -s t -l to -d 'Move bookmarks to this revision' -r
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from m" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from m" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from m" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from m" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from m" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from m" -s B -l allow-backwards -d 'Allow moving bookmarks backwards or sideways'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from m" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from m" -l no-integrate-operation -d 'Run the command as usual but don\'t integrate any operations'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from m" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from m" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from m" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from m" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from m" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from rename" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from rename" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from rename" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from rename" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from rename" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from rename" -l overwrite-existing -d 'Allow renaming even if the new bookmark name already exists'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from rename" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from rename" -l no-integrate-operation -d 'Run the command as usual but don\'t integrate any operations'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from rename" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from rename" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from rename" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from rename" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from rename" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from r" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from r" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from r" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from r" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from r" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from r" -l overwrite-existing -d 'Allow renaming even if the new bookmark name already exists'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from r" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from r" -l no-integrate-operation -d 'Run the command as usual but don\'t integrate any operations'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from r" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from r" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from r" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from r" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from r" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from set" -s r -l revision -l to -d 'The bookmark\'s target revision' -r
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from set" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from set" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from set" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from set" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from set" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from set" -s B -l allow-backwards -d 'Allow moving the bookmark backwards or sideways'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from set" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from set" -l no-integrate-operation -d 'Run the command as usual but don\'t integrate any operations'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from set" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from set" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from set" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from set" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from set" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from s" -s r -l revision -l to -d 'The bookmark\'s target revision' -r
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from s" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from s" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from s" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from s" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from s" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from s" -s B -l allow-backwards -d 'Allow moving the bookmark backwards or sideways'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from s" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from s" -l no-integrate-operation -d 'Run the command as usual but don\'t integrate any operations'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from s" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from s" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from s" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from s" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from s" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from track" -l remote -d 'Remote names to track' -r
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from track" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from track" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from track" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from track" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from track" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from track" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from track" -l no-integrate-operation -d 'Run the command as usual but don\'t integrate any operations'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from track" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from track" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from track" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from track" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from track" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from t" -l remote -d 'Remote names to track' -r
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from t" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from t" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from t" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from t" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from t" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from t" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from t" -l no-integrate-operation -d 'Run the command as usual but don\'t integrate any operations'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from t" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from t" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from t" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from t" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from t" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from untrack" -l remote -d 'Remote names to untrack' -r
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from untrack" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from untrack" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from untrack" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from untrack" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from untrack" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from untrack" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from untrack" -l no-integrate-operation -d 'Run the command as usual but don\'t integrate any operations'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from untrack" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from untrack" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from untrack" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from untrack" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from untrack" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand commit" -l tool -d 'Specify diff editor to be used (implies --interactive)' -r
complete -c jj -n "__fish_jj_using_subcommand commit" -s m -l message -d 'The change description to use (don\'t open editor)' -r
complete -c jj -n "__fish_jj_using_subcommand commit" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand commit" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand commit" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand commit" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand commit" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand commit" -s i -l interactive -d 'Interactively choose which changes to include in the current commit'
complete -c jj -n "__fish_jj_using_subcommand commit" -l editor -d 'Open an editor to edit the change description'
complete -c jj -n "__fish_jj_using_subcommand commit" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand commit" -l no-integrate-operation -d 'Run the command as usual but don\'t integrate any operations'
complete -c jj -n "__fish_jj_using_subcommand commit" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand commit" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand commit" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand commit" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand commit" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand config; and not __fish_seen_subcommand_from edit e gc get g list l path p set s unset u" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand config; and not __fish_seen_subcommand_from edit e gc get g list l path p set s unset u" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand config; and not __fish_seen_subcommand_from edit e gc get g list l path p set s unset u" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand config; and not __fish_seen_subcommand_from edit e gc get g list l path p set s unset u" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand config; and not __fish_seen_subcommand_from edit e gc get g list l path p set s unset u" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand config; and not __fish_seen_subcommand_from edit e gc get g list l path p set s unset u" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand config; and not __fish_seen_subcommand_from edit e gc get g list l path p set s unset u" -l no-integrate-operation -d 'Run the command as usual but don\'t integrate any operations'
complete -c jj -n "__fish_jj_using_subcommand config; and not __fish_seen_subcommand_from edit e gc get g list l path p set s unset u" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand config; and not __fish_seen_subcommand_from edit e gc get g list l path p set s unset u" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand config; and not __fish_seen_subcommand_from edit e gc get g list l path p set s unset u" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand config; and not __fish_seen_subcommand_from edit e gc get g list l path p set s unset u" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand config; and not __fish_seen_subcommand_from edit e gc get g list l path p set s unset u" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand config; and not __fish_seen_subcommand_from edit e gc get g list l path p set s unset u" -f -a "edit" -d 'Start an editor on a jj config file'
complete -c jj -n "__fish_jj_using_subcommand config; and not __fish_seen_subcommand_from edit e gc get g list l path p set s unset u" -f -a "e" -d 'Start an editor on a jj config file'
complete -c jj -n "__fish_jj_using_subcommand config; and not __fish_seen_subcommand_from edit e gc get g list l path p set s unset u" -f -a "gc" -d 'Find and optionally delete repo-level config directories whose repo path no longer exists'
complete -c jj -n "__fish_jj_using_subcommand config; and not __fish_seen_subcommand_from edit e gc get g list l path p set s unset u" -f -a "get" -d 'Get the value of a given config option.'
complete -c jj -n "__fish_jj_using_subcommand config; and not __fish_seen_subcommand_from edit e gc get g list l path p set s unset u" -f -a "g" -d 'Get the value of a given config option.'
complete -c jj -n "__fish_jj_using_subcommand config; and not __fish_seen_subcommand_from edit e gc get g list l path p set s unset u" -f -a "list" -d 'List variables set in config files, along with their values'
complete -c jj -n "__fish_jj_using_subcommand config; and not __fish_seen_subcommand_from edit e gc get g list l path p set s unset u" -f -a "l" -d 'List variables set in config files, along with their values'
complete -c jj -n "__fish_jj_using_subcommand config; and not __fish_seen_subcommand_from edit e gc get g list l path p set s unset u" -f -a "path" -d 'Print the paths to the config files'
complete -c jj -n "__fish_jj_using_subcommand config; and not __fish_seen_subcommand_from edit e gc get g list l path p set s unset u" -f -a "p" -d 'Print the paths to the config files'
complete -c jj -n "__fish_jj_using_subcommand config; and not __fish_seen_subcommand_from edit e gc get g list l path p set s unset u" -f -a "set" -d 'Update a config file to set the given option to a given value'
complete -c jj -n "__fish_jj_using_subcommand config; and not __fish_seen_subcommand_from edit e gc get g list l path p set s unset u" -f -a "s" -d 'Update a config file to set the given option to a given value'
complete -c jj -n "__fish_jj_using_subcommand config; and not __fish_seen_subcommand_from edit e gc get g list l path p set s unset u" -f -a "unset" -d 'Update a config file to unset the given option'
complete -c jj -n "__fish_jj_using_subcommand config; and not __fish_seen_subcommand_from edit e gc get g list l path p set s unset u" -f -a "u" -d 'Update a config file to unset the given option'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from edit" -l file -d 'Target the config file specified by the given path' -r -F
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from edit" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from edit" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from edit" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from edit" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from edit" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from edit" -l user -d 'Target the user-level config'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from edit" -l repo -d 'Target the repo-level config'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from edit" -l workspace -d 'Target the workspace-level config'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from edit" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from edit" -l no-integrate-operation -d 'Run the command as usual but don\'t integrate any operations'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from edit" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from edit" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from edit" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from edit" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from edit" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from e" -l file -d 'Target the config file specified by the given path' -r -F
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from e" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from e" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from e" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from e" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from e" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from e" -l user -d 'Target the user-level config'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from e" -l repo -d 'Target the repo-level config'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from e" -l workspace -d 'Target the workspace-level config'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from e" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from e" -l no-integrate-operation -d 'Run the command as usual but don\'t integrate any operations'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from e" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from e" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from e" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from e" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from e" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from gc" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from gc" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from gc" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from gc" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from gc" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from gc" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from gc" -l no-integrate-operation -d 'Run the command as usual but don\'t integrate any operations'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from gc" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from gc" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from gc" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from gc" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from gc" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from get" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from get" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from get" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from get" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from get" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from get" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from get" -l no-integrate-operation -d 'Run the command as usual but don\'t integrate any operations'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from get" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from get" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from get" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from get" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from get" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from g" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from g" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from g" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from g" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from g" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from g" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from g" -l no-integrate-operation -d 'Run the command as usual but don\'t integrate any operations'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from g" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from g" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from g" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from g" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from g" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from list" -s T -l template -d 'Render each variable using the given template' -r
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from list" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from list" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from list" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from list" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from list" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from list" -l include-defaults -d 'Whether to explicitly include built-in default values in the list'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from list" -l include-overridden -d 'Allow printing overridden values'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from list" -l user -d 'Target the user-level config'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from list" -l repo -d 'Target the repo-level config'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from list" -l workspace -d 'Target the workspace-level config'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from list" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from list" -l no-integrate-operation -d 'Run the command as usual but don\'t integrate any operations'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from list" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from list" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from list" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from list" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from list" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from l" -s T -l template -d 'Render each variable using the given template' -r
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from l" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from l" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from l" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from l" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from l" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from l" -l include-defaults -d 'Whether to explicitly include built-in default values in the list'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from l" -l include-overridden -d 'Allow printing overridden values'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from l" -l user -d 'Target the user-level config'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from l" -l repo -d 'Target the repo-level config'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from l" -l workspace -d 'Target the workspace-level config'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from l" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from l" -l no-integrate-operation -d 'Run the command as usual but don\'t integrate any operations'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from l" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from l" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from l" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from l" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from l" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from path" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from path" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from path" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from path" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from path" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from path" -l user -d 'Target the user-level config'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from path" -l repo -d 'Target the repo-level config'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from path" -l workspace -d 'Target the workspace-level config'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from path" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from path" -l no-integrate-operation -d 'Run the command as usual but don\'t integrate any operations'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from path" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from path" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from path" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from path" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from path" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from p" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from p" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from p" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from p" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from p" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from p" -l user -d 'Target the user-level config'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from p" -l repo -d 'Target the repo-level config'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from p" -l workspace -d 'Target the workspace-level config'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from p" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from p" -l no-integrate-operation -d 'Run the command as usual but don\'t integrate any operations'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from p" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from p" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from p" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from p" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from p" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from set" -l file -d 'Target the config file specified by the given path' -r -F
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from set" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from set" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from set" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from set" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from set" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from set" -l user -d 'Target the user-level config'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from set" -l repo -d 'Target the repo-level config'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from set" -l workspace -d 'Target the workspace-level config'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from set" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from set" -l no-integrate-operation -d 'Run the command as usual but don\'t integrate any operations'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from set" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from set" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from set" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from set" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from set" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from s" -l file -d 'Target the config file specified by the given path' -r -F
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from s" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from s" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from s" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from s" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from s" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from s" -l user -d 'Target the user-level config'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from s" -l repo -d 'Target the repo-level config'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from s" -l workspace -d 'Target the workspace-level config'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from s" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from s" -l no-integrate-operation -d 'Run the command as usual but don\'t integrate any operations'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from s" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from s" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from s" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from s" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from s" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from unset" -l file -d 'Target the config file specified by the given path' -r -F
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from unset" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from unset" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from unset" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from unset" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from unset" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from unset" -l user -d 'Target the user-level config'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from unset" -l repo -d 'Target the repo-level config'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from unset" -l workspace -d 'Target the workspace-level config'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from unset" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from unset" -l no-integrate-operation -d 'Run the command as usual but don\'t integrate any operations'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from unset" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from unset" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from unset" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from unset" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from unset" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from u" -l file -d 'Target the config file specified by the given path' -r -F
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from u" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from u" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from u" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from u" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from u" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from u" -l user -d 'Target the user-level config'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from u" -l repo -d 'Target the repo-level config'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from u" -l workspace -d 'Target the workspace-level config'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from u" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from u" -l no-integrate-operation -d 'Run the command as usual but don\'t integrate any operations'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from u" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from u" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from u" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from u" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from u" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand converge" -s r -l revision -d 'The search space to look for divergent revisions' -r
complete -c jj -n "__fish_jj_using_subcommand converge" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand converge" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand converge" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand converge" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand converge" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand converge" -l no-interactive -d 'Do not prompt the user for help resolving divergence'
complete -c jj -n "__fish_jj_using_subcommand converge" -s i -l interactive -d 'No-op flag to pair with --no-interactive'
complete -c jj -n "__fish_jj_using_subcommand converge" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand converge" -l no-integrate-operation -d 'Run the command as usual but don\'t integrate any operations'
complete -c jj -n "__fish_jj_using_subcommand converge" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand converge" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand converge" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand converge" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand converge" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand debug; and not __fish_seen_subcommand_from copy-detection fileset index index-changed-paths init-simple local-working-copy object reindex revset snapshot stacked-table template tree watchman working-copy" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand debug; and not __fish_seen_subcommand_from copy-detection fileset index index-changed-paths init-simple local-working-copy object reindex revset snapshot stacked-table template tree watchman working-copy" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand debug; and not __fish_seen_subcommand_from copy-detection fileset index index-changed-paths init-simple local-working-copy object reindex revset snapshot stacked-table template tree watchman working-copy" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand debug; and not __fish_seen_subcommand_from copy-detection fileset index index-changed-paths init-simple local-working-copy object reindex revset snapshot stacked-table template tree watchman working-copy" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand debug; and not __fish_seen_subcommand_from copy-detection fileset index index-changed-paths init-simple local-working-copy object reindex revset snapshot stacked-table template tree watchman working-copy" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand debug; and not __fish_seen_subcommand_from copy-detection fileset index index-changed-paths init-simple local-working-copy object reindex revset snapshot stacked-table template tree watchman working-copy" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand debug; and not __fish_seen_subcommand_from copy-detection fileset index index-changed-paths init-simple local-working-copy object reindex revset snapshot stacked-table template tree watchman working-copy" -l no-integrate-operation -d 'Run the command as usual but don\'t integrate any operations'
complete -c jj -n "__fish_jj_using_subcommand debug; and not __fish_seen_subcommand_from copy-detection fileset index index-changed-paths init-simple local-working-copy object reindex revset snapshot stacked-table template tree watchman working-copy" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand debug; and not __fish_seen_subcommand_from copy-detection fileset index index-changed-paths init-simple local-working-copy object reindex revset snapshot stacked-table template tree watchman working-copy" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand debug; and not __fish_seen_subcommand_from copy-detection fileset index index-changed-paths init-simple local-working-copy object reindex revset snapshot stacked-table template tree watchman working-copy" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand debug; and not __fish_seen_subcommand_from copy-detection fileset index index-changed-paths init-simple local-working-copy object reindex revset snapshot stacked-table template tree watchman working-copy" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand debug; and not __fish_seen_subcommand_from copy-detection fileset index index-changed-paths init-simple local-working-copy object reindex revset snapshot stacked-table template tree watchman working-copy" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand debug; and not __fish_seen_subcommand_from copy-detection fileset index index-changed-paths init-simple local-working-copy object reindex revset snapshot stacked-table template tree watchman working-copy" -f -a "copy-detection" -d 'Show information about file copies detected'
complete -c jj -n "__fish_jj_using_subcommand debug; and not __fish_seen_subcommand_from copy-detection fileset index index-changed-paths init-simple local-working-copy object reindex revset snapshot stacked-table template tree watchman working-copy" -f -a "fileset" -d 'Parse fileset expression'
complete -c jj -n "__fish_jj_using_subcommand debug; and not __fish_seen_subcommand_from copy-detection fileset index index-changed-paths init-simple local-working-copy object reindex revset snapshot stacked-table template tree watchman working-copy" -f -a "index" -d 'Show commit index stats'
complete -c jj -n "__fish_jj_using_subcommand debug; and not __fish_seen_subcommand_from copy-detection fileset index index-changed-paths init-simple local-working-copy object reindex revset snapshot stacked-table template tree watchman working-copy" -f -a "index-changed-paths" -d 'Build changed-path index'
complete -c jj -n "__fish_jj_using_subcommand debug; and not __fish_seen_subcommand_from copy-detection fileset index index-changed-paths init-simple local-working-copy object reindex revset snapshot stacked-table template tree watchman working-copy" -f -a "init-simple" -d 'Create a new repo in the given directory using the proof-of-concept simple backend'
complete -c jj -n "__fish_jj_using_subcommand debug; and not __fish_seen_subcommand_from copy-detection fileset index index-changed-paths init-simple local-working-copy object reindex revset snapshot stacked-table template tree watchman working-copy" -f -a "local-working-copy" -d 'Show information about the local working copy state'
complete -c jj -n "__fish_jj_using_subcommand debug; and not __fish_seen_subcommand_from copy-detection fileset index index-changed-paths init-simple local-working-copy object reindex revset snapshot stacked-table template tree watchman working-copy" -f -a "object" -d 'Show information about an operation and its view'
complete -c jj -n "__fish_jj_using_subcommand debug; and not __fish_seen_subcommand_from copy-detection fileset index index-changed-paths init-simple local-working-copy object reindex revset snapshot stacked-table template tree watchman working-copy" -f -a "reindex" -d 'Rebuild commit index'
complete -c jj -n "__fish_jj_using_subcommand debug; and not __fish_seen_subcommand_from copy-detection fileset index index-changed-paths init-simple local-working-copy object reindex revset snapshot stacked-table template tree watchman working-copy" -f -a "revset" -d 'Evaluate revset to full commit IDs'
complete -c jj -n "__fish_jj_using_subcommand debug; and not __fish_seen_subcommand_from copy-detection fileset index index-changed-paths init-simple local-working-copy object reindex revset snapshot stacked-table template tree watchman working-copy" -f -a "snapshot" -d '[DEPRECATED] Trigger a snapshot in the op log'
complete -c jj -n "__fish_jj_using_subcommand debug; and not __fish_seen_subcommand_from copy-detection fileset index index-changed-paths init-simple local-working-copy object reindex revset snapshot stacked-table template tree watchman working-copy" -f -a "stacked-table" -d 'Show stats of stacked table'
complete -c jj -n "__fish_jj_using_subcommand debug; and not __fish_seen_subcommand_from copy-detection fileset index index-changed-paths init-simple local-working-copy object reindex revset snapshot stacked-table template tree watchman working-copy" -f -a "template" -d 'Parse a template'
complete -c jj -n "__fish_jj_using_subcommand debug; and not __fish_seen_subcommand_from copy-detection fileset index index-changed-paths init-simple local-working-copy object reindex revset snapshot stacked-table template tree watchman working-copy" -f -a "tree" -d 'List the recursive entries of a tree'
complete -c jj -n "__fish_jj_using_subcommand debug; and not __fish_seen_subcommand_from copy-detection fileset index index-changed-paths init-simple local-working-copy object reindex revset snapshot stacked-table template tree watchman working-copy" -f -a "watchman"
complete -c jj -n "__fish_jj_using_subcommand debug; and not __fish_seen_subcommand_from copy-detection fileset index index-changed-paths init-simple local-working-copy object reindex revset snapshot stacked-table template tree watchman working-copy" -f -a "working-copy" -d 'Show information about the working copy state'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from copy-detection" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from copy-detection" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from copy-detection" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from copy-detection" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from copy-detection" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from copy-detection" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from copy-detection" -l no-integrate-operation -d 'Run the command as usual but don\'t integrate any operations'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from copy-detection" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from copy-detection" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from copy-detection" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from copy-detection" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from copy-detection" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from fileset" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from fileset" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from fileset" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from fileset" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from fileset" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from fileset" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from fileset" -l no-integrate-operation -d 'Run the command as usual but don\'t integrate any operations'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from fileset" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from fileset" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from fileset" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from fileset" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from fileset" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from index" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from index" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from index" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from index" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from index" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from index" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from index" -l no-integrate-operation -d 'Run the command as usual but don\'t integrate any operations'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from index" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from index" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from index" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from index" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from index" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from index-changed-paths" -s n -l limit -d 'Limit number of revisions to index' -r
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from index-changed-paths" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from index-changed-paths" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from index-changed-paths" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from index-changed-paths" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from index-changed-paths" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from index-changed-paths" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from index-changed-paths" -l no-integrate-operation -d 'Run the command as usual but don\'t integrate any operations'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from index-changed-paths" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from index-changed-paths" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from index-changed-paths" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from index-changed-paths" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from index-changed-paths" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from init-simple" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from init-simple" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from init-simple" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from init-simple" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from init-simple" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from init-simple" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from init-simple" -l no-integrate-operation -d 'Run the command as usual but don\'t integrate any operations'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from init-simple" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from init-simple" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from init-simple" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from init-simple" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from init-simple" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from local-working-copy" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from local-working-copy" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from local-working-copy" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from local-working-copy" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from local-working-copy" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from local-working-copy" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from local-working-copy" -l no-integrate-operation -d 'Run the command as usual but don\'t integrate any operations'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from local-working-copy" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from local-working-copy" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from local-working-copy" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from local-working-copy" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from local-working-copy" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from object" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from object" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from object" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from object" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from object" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from object" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from object" -l no-integrate-operation -d 'Run the command as usual but don\'t integrate any operations'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from object" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from object" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from object" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from object" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from object" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from object" -f -a "commit"
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from object" -f -a "file"
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from object" -f -a "operation"
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from object" -f -a "symlink"
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from object" -f -a "tree"
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from object" -f -a "view"
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from reindex" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from reindex" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from reindex" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from reindex" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from reindex" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from reindex" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from reindex" -l no-integrate-operation -d 'Run the command as usual but don\'t integrate any operations'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from reindex" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from reindex" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from reindex" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from reindex" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from reindex" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from revset" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from revset" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from revset" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from revset" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from revset" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from revset" -l no-resolve -d 'Do not resolve and evaluate expression'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from revset" -l no-optimize -d 'Do not rewrite expression to optimized form'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from revset" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from revset" -l no-integrate-operation -d 'Run the command as usual but don\'t integrate any operations'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from revset" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from revset" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from revset" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from revset" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from revset" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from snapshot" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from snapshot" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from snapshot" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from snapshot" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from snapshot" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from snapshot" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from snapshot" -l no-integrate-operation -d 'Run the command as usual but don\'t integrate any operations'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from snapshot" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from snapshot" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from snapshot" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from snapshot" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from snapshot" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from stacked-table" -s n -l key-size -d 'Key size in bytes' -r
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from stacked-table" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from stacked-table" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from stacked-table" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from stacked-table" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from stacked-table" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from stacked-table" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from stacked-table" -l no-integrate-operation -d 'Run the command as usual but don\'t integrate any operations'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from stacked-table" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from stacked-table" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from stacked-table" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from stacked-table" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from stacked-table" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from template" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from template" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from template" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from template" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from template" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from template" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from template" -l no-integrate-operation -d 'Run the command as usual but don\'t integrate any operations'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from template" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from template" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from template" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from template" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from template" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from tree" -s r -l revision -r
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from tree" -l id -r
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from tree" -l dir -r
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from tree" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from tree" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from tree" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from tree" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from tree" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from tree" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from tree" -l no-integrate-operation -d 'Run the command as usual but don\'t integrate any operations'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from tree" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from tree" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from tree" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from tree" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from tree" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from watchman" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from watchman" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from watchman" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from watchman" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from watchman" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from watchman" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from watchman" -l no-integrate-operation -d 'Run the command as usual but don\'t integrate any operations'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from watchman" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from watchman" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from watchman" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from watchman" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from watchman" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from watchman" -f -a "status" -d 'Check whether `watchman` is enabled and whether it\'s correctly installed'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from watchman" -f -a "query-clock"
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from watchman" -f -a "query-changed-files"
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from watchman" -f -a "reset-clock"
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from working-copy" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from working-copy" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from working-copy" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from working-copy" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from working-copy" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from working-copy" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from working-copy" -l no-integrate-operation -d 'Run the command as usual but don\'t integrate any operations'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from working-copy" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from working-copy" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from working-copy" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from working-copy" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from working-copy" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand describe" -s r -r
complete -c jj -n "__fish_jj_using_subcommand describe" -s m -l message -d 'The change description to use (don\'t open editor)' -r
complete -c jj -n "__fish_jj_using_subcommand describe" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand describe" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand describe" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand describe" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand describe" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand describe" -l stdin -d 'Read the change description from stdin'
complete -c jj -n "__fish_jj_using_subcommand describe" -l editor -d 'Open an editor to edit the change description'
complete -c jj -n "__fish_jj_using_subcommand describe" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand describe" -l no-integrate-operation -d 'Run the command as usual but don\'t integrate any operations'
complete -c jj -n "__fish_jj_using_subcommand describe" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand describe" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand describe" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand describe" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand describe" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand diff" -s r -l revisions -d 'Show changes in these revisions' -r
complete -c jj -n "__fish_jj_using_subcommand diff" -s f -l from -d 'Show changes from this revision' -r
complete -c jj -n "__fish_jj_using_subcommand diff" -s t -l to -d 'Show changes to this revision' -r
complete -c jj -n "__fish_jj_using_subcommand diff" -s T -l template -d 'Render each file diff entry using the given template' -r
complete -c jj -n "__fish_jj_using_subcommand diff" -l tool -d 'Generate diff by external command' -r
complete -c jj -n "__fish_jj_using_subcommand diff" -l context -d 'Number of lines of context to show' -r
complete -c jj -n "__fish_jj_using_subcommand diff" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand diff" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand diff" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand diff" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand diff" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand diff" -s s -l summary -d 'For each path, show only whether it was modified, added, or deleted'
complete -c jj -n "__fish_jj_using_subcommand diff" -l stat -d 'Show a histogram of the changes'
complete -c jj -n "__fish_jj_using_subcommand diff" -l types -d 'For each path, show only its type before and after'
complete -c jj -n "__fish_jj_using_subcommand diff" -l name-only -d 'For each path, show only its path'
complete -c jj -n "__fish_jj_using_subcommand diff" -l git -d 'Show a Git-format diff'
complete -c jj -n "__fish_jj_using_subcommand diff" -l color-words -d 'Show a word-level diff with changes indicated only by color'
complete -c jj -n "__fish_jj_using_subcommand diff" -s w -l ignore-all-space -d 'Ignore whitespace when comparing lines'
complete -c jj -n "__fish_jj_using_subcommand diff" -s b -l ignore-space-change -d 'Ignore changes in amount of whitespace when comparing lines'
complete -c jj -n "__fish_jj_using_subcommand diff" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand diff" -l no-integrate-operation -d 'Run the command as usual but don\'t integrate any operations'
complete -c jj -n "__fish_jj_using_subcommand diff" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand diff" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand diff" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand diff" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand diff" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand diffedit" -s r -l revision -d 'The revision to touch up' -r
complete -c jj -n "__fish_jj_using_subcommand diffedit" -s f -l from -d 'Show changes from this revision' -r
complete -c jj -n "__fish_jj_using_subcommand diffedit" -s t -l to -d 'Edit changes in this revision' -r
complete -c jj -n "__fish_jj_using_subcommand diffedit" -l tool -d 'Specify diff editor to be used' -r
complete -c jj -n "__fish_jj_using_subcommand diffedit" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand diffedit" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand diffedit" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand diffedit" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand diffedit" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand diffedit" -l restore-descendants -d 'Preserve the content (not the diff) when rebasing descendants'
complete -c jj -n "__fish_jj_using_subcommand diffedit" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand diffedit" -l no-integrate-operation -d 'Run the command as usual but don\'t integrate any operations'
complete -c jj -n "__fish_jj_using_subcommand diffedit" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand diffedit" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand diffedit" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand diffedit" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand diffedit" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand duplicate" -s r -r
complete -c jj -n "__fish_jj_using_subcommand duplicate" -s o -s d -l onto -l destination -d 'The revision(s) to duplicate onto (can be repeated to create a merge commit)' -r
complete -c jj -n "__fish_jj_using_subcommand duplicate" -s A -l insert-after -l after -d 'The revision(s) to insert after (can be repeated to create a merge commit)' -r
complete -c jj -n "__fish_jj_using_subcommand duplicate" -s B -l insert-before -l before -d 'The revision(s) to insert before (can be repeated to create a merge commit)' -r
complete -c jj -n "__fish_jj_using_subcommand duplicate" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand duplicate" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand duplicate" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand duplicate" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand duplicate" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand duplicate" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand duplicate" -l no-integrate-operation -d 'Run the command as usual but don\'t integrate any operations'
complete -c jj -n "__fish_jj_using_subcommand duplicate" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand duplicate" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand duplicate" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand duplicate" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand duplicate" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand edit" -s r -r
complete -c jj -n "__fish_jj_using_subcommand edit" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand edit" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand edit" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand edit" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand edit" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand edit" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand edit" -l no-integrate-operation -d 'Run the command as usual but don\'t integrate any operations'
complete -c jj -n "__fish_jj_using_subcommand edit" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand edit" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand edit" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand edit" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand edit" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand evolog" -s r -l revisions -d 'Follow changes from these revisions' -r
complete -c jj -n "__fish_jj_using_subcommand evolog" -s n -l limit -d 'Limit number of revisions to show' -r
complete -c jj -n "__fish_jj_using_subcommand evolog" -s T -l template -d 'Render each revision using the given template' -r
complete -c jj -n "__fish_jj_using_subcommand evolog" -l tool -d 'Generate diff by external command' -r
complete -c jj -n "__fish_jj_using_subcommand evolog" -l context -d 'Number of lines of context to show' -r
complete -c jj -n "__fish_jj_using_subcommand evolog" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand evolog" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand evolog" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand evolog" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand evolog" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand evolog" -l reversed -d 'Show revisions in the opposite order (older revisions first)'
complete -c jj -n "__fish_jj_using_subcommand evolog" -s G -l no-graph -d 'Show a flat list of revisions instead of a graph'
complete -c jj -n "__fish_jj_using_subcommand evolog" -s p -l patch -d 'Show patch compared to the previous version of this change'
complete -c jj -n "__fish_jj_using_subcommand evolog" -s s -l summary -d 'For each path, show only whether it was modified, added, or deleted'
complete -c jj -n "__fish_jj_using_subcommand evolog" -l stat -d 'Show a histogram of the changes'
complete -c jj -n "__fish_jj_using_subcommand evolog" -l types -d 'For each path, show only its type before and after'
complete -c jj -n "__fish_jj_using_subcommand evolog" -l name-only -d 'For each path, show only its path'
complete -c jj -n "__fish_jj_using_subcommand evolog" -l git -d 'Show a Git-format diff'
complete -c jj -n "__fish_jj_using_subcommand evolog" -l color-words -d 'Show a word-level diff with changes indicated only by color'
complete -c jj -n "__fish_jj_using_subcommand evolog" -l ignore-all-space -d 'Ignore whitespace when comparing lines'
complete -c jj -n "__fish_jj_using_subcommand evolog" -l ignore-space-change -d 'Ignore changes in amount of whitespace when comparing lines'
complete -c jj -n "__fish_jj_using_subcommand evolog" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand evolog" -l no-integrate-operation -d 'Run the command as usual but don\'t integrate any operations'
complete -c jj -n "__fish_jj_using_subcommand evolog" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand evolog" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand evolog" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand evolog" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand evolog" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand evolution-log" -s r -l revisions -d 'Follow changes from these revisions' -r
complete -c jj -n "__fish_jj_using_subcommand evolution-log" -s n -l limit -d 'Limit number of revisions to show' -r
complete -c jj -n "__fish_jj_using_subcommand evolution-log" -s T -l template -d 'Render each revision using the given template' -r
complete -c jj -n "__fish_jj_using_subcommand evolution-log" -l tool -d 'Generate diff by external command' -r
complete -c jj -n "__fish_jj_using_subcommand evolution-log" -l context -d 'Number of lines of context to show' -r
complete -c jj -n "__fish_jj_using_subcommand evolution-log" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand evolution-log" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand evolution-log" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand evolution-log" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand evolution-log" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand evolution-log" -l reversed -d 'Show revisions in the opposite order (older revisions first)'
complete -c jj -n "__fish_jj_using_subcommand evolution-log" -s G -l no-graph -d 'Show a flat list of revisions instead of a graph'
complete -c jj -n "__fish_jj_using_subcommand evolution-log" -s p -l patch -d 'Show patch compared to the previous version of this change'
complete -c jj -n "__fish_jj_using_subcommand evolution-log" -s s -l summary -d 'For each path, show only whether it was modified, added, or deleted'
complete -c jj -n "__fish_jj_using_subcommand evolution-log" -l stat -d 'Show a histogram of the changes'
complete -c jj -n "__fish_jj_using_subcommand evolution-log" -l types -d 'For each path, show only its type before and after'
complete -c jj -n "__fish_jj_using_subcommand evolution-log" -l name-only -d 'For each path, show only its path'
complete -c jj -n "__fish_jj_using_subcommand evolution-log" -l git -d 'Show a Git-format diff'
complete -c jj -n "__fish_jj_using_subcommand evolution-log" -l color-words -d 'Show a word-level diff with changes indicated only by color'
complete -c jj -n "__fish_jj_using_subcommand evolution-log" -l ignore-all-space -d 'Ignore whitespace when comparing lines'
complete -c jj -n "__fish_jj_using_subcommand evolution-log" -l ignore-space-change -d 'Ignore changes in amount of whitespace when comparing lines'
complete -c jj -n "__fish_jj_using_subcommand evolution-log" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand evolution-log" -l no-integrate-operation -d 'Run the command as usual but don\'t integrate any operations'
complete -c jj -n "__fish_jj_using_subcommand evolution-log" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand evolution-log" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand evolution-log" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand evolution-log" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand evolution-log" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand file; and not __fish_seen_subcommand_from annotate chmod list search show track untrack" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand file; and not __fish_seen_subcommand_from annotate chmod list search show track untrack" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand file; and not __fish_seen_subcommand_from annotate chmod list search show track untrack" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand file; and not __fish_seen_subcommand_from annotate chmod list search show track untrack" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand file; and not __fish_seen_subcommand_from annotate chmod list search show track untrack" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand file; and not __fish_seen_subcommand_from annotate chmod list search show track untrack" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand file; and not __fish_seen_subcommand_from annotate chmod list search show track untrack" -l no-integrate-operation -d 'Run the command as usual but don\'t integrate any operations'
complete -c jj -n "__fish_jj_using_subcommand file; and not __fish_seen_subcommand_from annotate chmod list search show track untrack" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand file; and not __fish_seen_subcommand_from annotate chmod list search show track untrack" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand file; and not __fish_seen_subcommand_from annotate chmod list search show track untrack" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand file; and not __fish_seen_subcommand_from annotate chmod list search show track untrack" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand file; and not __fish_seen_subcommand_from annotate chmod list search show track untrack" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand file; and not __fish_seen_subcommand_from annotate chmod list search show track untrack" -f -a "annotate" -d 'Show the source change for each line of the target file'
complete -c jj -n "__fish_jj_using_subcommand file; and not __fish_seen_subcommand_from annotate chmod list search show track untrack" -f -a "chmod" -d 'Sets or removes the executable bit for paths in the repo'
complete -c jj -n "__fish_jj_using_subcommand file; and not __fish_seen_subcommand_from annotate chmod list search show track untrack" -f -a "list" -d 'List files in a revision'
complete -c jj -n "__fish_jj_using_subcommand file; and not __fish_seen_subcommand_from annotate chmod list search show track untrack" -f -a "search" -d 'Search for content in files'
complete -c jj -n "__fish_jj_using_subcommand file; and not __fish_seen_subcommand_from annotate chmod list search show track untrack" -f -a "show" -d 'Print contents of files in a revision'
complete -c jj -n "__fish_jj_using_subcommand file; and not __fish_seen_subcommand_from annotate chmod list search show track untrack" -f -a "track" -d 'Start tracking specified paths in the working copy'
complete -c jj -n "__fish_jj_using_subcommand file; and not __fish_seen_subcommand_from annotate chmod list search show track untrack" -f -a "untrack" -d 'Stop tracking specified paths in the working copy'
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from annotate" -s r -l revision -d 'an optional revision to start at' -r
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from annotate" -s T -l template -d 'Render each line using the given template' -r
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from annotate" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from annotate" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from annotate" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from annotate" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from annotate" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from annotate" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from annotate" -l no-integrate-operation -d 'Run the command as usual but don\'t integrate any operations'
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from annotate" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from annotate" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from annotate" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from annotate" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from annotate" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from chmod" -s r -l revision -d 'The revision to update' -r
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from chmod" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from chmod" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from chmod" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from chmod" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from chmod" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from chmod" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from chmod" -l no-integrate-operation -d 'Run the command as usual but don\'t integrate any operations'
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from chmod" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from chmod" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from chmod" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from chmod" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from chmod" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from list" -s r -l revision -d 'The revision to list files in' -r
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from list" -s T -l template -d 'Render each file entry using the given template' -r
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from list" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from list" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from list" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from list" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from list" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from list" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from list" -l no-integrate-operation -d 'Run the command as usual but don\'t integrate any operations'
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from list" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from list" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from list" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from list" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from list" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from search" -s r -l revision -d 'The revision to search files in' -r
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from search" -s p -l pattern -d 'The pattern to search for in a single line' -r
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from search" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from search" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from search" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from search" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from search" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from search" -l name-only -d 'Print only the paths of files that contain a match, not the matched lines'
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from search" -s n -l line-number -d 'Prefix each matched line with its 1-based line number within the file'
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from search" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from search" -l no-integrate-operation -d 'Run the command as usual but don\'t integrate any operations'
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from search" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from search" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from search" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from search" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from search" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from show" -s r -l revision -d 'The revision to get the file contents from' -r
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from show" -s T -l template -d 'Render each file metadata using the given template' -r
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from show" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from show" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from show" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from show" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from show" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from show" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from show" -l no-integrate-operation -d 'Run the command as usual but don\'t integrate any operations'
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from show" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from show" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from show" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from show" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from show" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from track" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from track" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from track" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from track" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from track" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from track" -l include-ignored -d 'Track paths even if they\'re ignored or too large'
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from track" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from track" -l no-integrate-operation -d 'Run the command as usual but don\'t integrate any operations'
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from track" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from track" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from track" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from track" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from track" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from untrack" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from untrack" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from untrack" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from untrack" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from untrack" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from untrack" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from untrack" -l no-integrate-operation -d 'Run the command as usual but don\'t integrate any operations'
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from untrack" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from untrack" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from untrack" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from untrack" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from untrack" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand fix" -s s -l source -d 'Fix files in the specified revision(s) and their descendants. If no revisions are specified, this defaults to the `revsets.fix` setting, or `reachable(@, mutable())` if it is not set' -r
complete -c jj -n "__fish_jj_using_subcommand fix" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand fix" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand fix" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand fix" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand fix" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand fix" -l include-unchanged-files -d 'Fix unchanged files in addition to changed ones. If no paths are specified, all files in the repo will be fixed'
complete -c jj -n "__fish_jj_using_subcommand fix" -s a -l all-lines -d 'Format all lines instead of only modified lines'
complete -c jj -n "__fish_jj_using_subcommand fix" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand fix" -l no-integrate-operation -d 'Run the command as usual but don\'t integrate any operations'
complete -c jj -n "__fish_jj_using_subcommand fix" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand fix" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand fix" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand fix" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand fix" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand gerrit; and not __fish_seen_subcommand_from upload" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand gerrit; and not __fish_seen_subcommand_from upload" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand gerrit; and not __fish_seen_subcommand_from upload" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand gerrit; and not __fish_seen_subcommand_from upload" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand gerrit; and not __fish_seen_subcommand_from upload" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand gerrit; and not __fish_seen_subcommand_from upload" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand gerrit; and not __fish_seen_subcommand_from upload" -l no-integrate-operation -d 'Run the command as usual but don\'t integrate any operations'
complete -c jj -n "__fish_jj_using_subcommand gerrit; and not __fish_seen_subcommand_from upload" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand gerrit; and not __fish_seen_subcommand_from upload" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand gerrit; and not __fish_seen_subcommand_from upload" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand gerrit; and not __fish_seen_subcommand_from upload" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand gerrit; and not __fish_seen_subcommand_from upload" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand gerrit; and not __fish_seen_subcommand_from upload" -f -a "upload" -d 'Upload changes to Gerrit for code review, or update existing changes'
complete -c jj -n "__fish_jj_using_subcommand gerrit; and __fish_seen_subcommand_from upload" -s r -l revision -d 'The revisions to upload to Gerrit' -r
complete -c jj -n "__fish_jj_using_subcommand gerrit; and __fish_seen_subcommand_from upload" -s b -l remote-branch -d 'The location where your changes are intended to land' -r
complete -c jj -n "__fish_jj_using_subcommand gerrit; and __fish_seen_subcommand_from upload" -l remote -d 'The Gerrit remote to push to' -r
complete -c jj -n "__fish_jj_using_subcommand gerrit; and __fish_seen_subcommand_from upload" -l reviewer -d 'Add these emails as a reviewer (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand gerrit; and __fish_seen_subcommand_from upload" -l cc -d 'CC these emails on the change (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand gerrit; and __fish_seen_subcommand_from upload" -s l -l label -d 'Add the following labels configured by Gerrit (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand gerrit; and __fish_seen_subcommand_from upload" -l topic -d 'Apply a topic to the change' -r
complete -c jj -n "__fish_jj_using_subcommand gerrit; and __fish_seen_subcommand_from upload" -l hashtag -d 'Apply a hashtag to the change (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand gerrit; and __fish_seen_subcommand_from upload" -s m -l message -d 'The description for the patch set' -r
complete -c jj -n "__fish_jj_using_subcommand gerrit; and __fish_seen_subcommand_from upload" -l notify -d 'Who to email notifications to (defaults to all)' -r -f -a "none\t'No emails'
owner\t'Only the change owner is notified'
owner-reviewers\t'Only the change owner and reviewers will be notified'
all\t'All relevant users, including owner, reviewers, cc\'d, users that have starred the change, and users who have configured a watch on files in the change'"
complete -c jj -n "__fish_jj_using_subcommand gerrit; and __fish_seen_subcommand_from upload" -l deadline -d 'The deadline after which the push should be aborted' -r
complete -c jj -n "__fish_jj_using_subcommand gerrit; and __fish_seen_subcommand_from upload" -l custom -d 'Send the following custom keyed values to Gerrit (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand gerrit; and __fish_seen_subcommand_from upload" -s o -l option -d 'Send a `git push -o` option (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand gerrit; and __fish_seen_subcommand_from upload" -l trace -d 'For debugging Gerrit' -r
complete -c jj -n "__fish_jj_using_subcommand gerrit; and __fish_seen_subcommand_from upload" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand gerrit; and __fish_seen_subcommand_from upload" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand gerrit; and __fish_seen_subcommand_from upload" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand gerrit; and __fish_seen_subcommand_from upload" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand gerrit; and __fish_seen_subcommand_from upload" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand gerrit; and __fish_seen_subcommand_from upload" -s n -l dry-run -d 'Only display what will change on the remote; do not push changes to Gerrit'
complete -c jj -n "__fish_jj_using_subcommand gerrit; and __fish_seen_subcommand_from upload" -l edit -d 'Push the change as a change edit'
complete -c jj -n "__fish_jj_using_subcommand gerrit; and __fish_seen_subcommand_from upload" -l wip -d 'Mark the change as WIP (work in progress)'
complete -c jj -n "__fish_jj_using_subcommand gerrit; and __fish_seen_subcommand_from upload" -l ready -d 'Mark the change as ready (no longer work in progress)'
complete -c jj -n "__fish_jj_using_subcommand gerrit; and __fish_seen_subcommand_from upload" -l private -d 'Mark the change as private'
complete -c jj -n "__fish_jj_using_subcommand gerrit; and __fish_seen_subcommand_from upload" -l remove-private -d 'Unmark the change as private'
complete -c jj -n "__fish_jj_using_subcommand gerrit; and __fish_seen_subcommand_from upload" -l publish-comments -d 'Publish draft comments for the given change'
complete -c jj -n "__fish_jj_using_subcommand gerrit; and __fish_seen_subcommand_from upload" -l no-publish-comments -d 'Do not publish draft comments for the given change'
complete -c jj -n "__fish_jj_using_subcommand gerrit; and __fish_seen_subcommand_from upload" -l submit -d 'Directly submit the changes, bypassing code review'
complete -c jj -n "__fish_jj_using_subcommand gerrit; and __fish_seen_subcommand_from upload" -l skip-validation -d 'When --submit is provided, skip performing validations'
complete -c jj -n "__fish_jj_using_subcommand gerrit; and __fish_seen_subcommand_from upload" -l merged -d 'Create a new change, even if the change has already been merged'
complete -c jj -n "__fish_jj_using_subcommand gerrit; and __fish_seen_subcommand_from upload" -l ignore-attention-set -d 'Do not modify the attention set upon uploading'
complete -c jj -n "__fish_jj_using_subcommand gerrit; and __fish_seen_subcommand_from upload" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand gerrit; and __fish_seen_subcommand_from upload" -l no-integrate-operation -d 'Run the command as usual but don\'t integrate any operations'
complete -c jj -n "__fish_jj_using_subcommand gerrit; and __fish_seen_subcommand_from upload" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand gerrit; and __fish_seen_subcommand_from upload" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand gerrit; and __fish_seen_subcommand_from upload" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand gerrit; and __fish_seen_subcommand_from upload" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand gerrit; and __fish_seen_subcommand_from upload" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand git; and not __fish_seen_subcommand_from clone colocation export fetch import init push remote root" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand git; and not __fish_seen_subcommand_from clone colocation export fetch import init push remote root" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand git; and not __fish_seen_subcommand_from clone colocation export fetch import init push remote root" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand git; and not __fish_seen_subcommand_from clone colocation export fetch import init push remote root" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand git; and not __fish_seen_subcommand_from clone colocation export fetch import init push remote root" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand git; and not __fish_seen_subcommand_from clone colocation export fetch import init push remote root" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand git; and not __fish_seen_subcommand_from clone colocation export fetch import init push remote root" -l no-integrate-operation -d 'Run the command as usual but don\'t integrate any operations'
complete -c jj -n "__fish_jj_using_subcommand git; and not __fish_seen_subcommand_from clone colocation export fetch import init push remote root" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand git; and not __fish_seen_subcommand_from clone colocation export fetch import init push remote root" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand git; and not __fish_seen_subcommand_from clone colocation export fetch import init push remote root" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand git; and not __fish_seen_subcommand_from clone colocation export fetch import init push remote root" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand git; and not __fish_seen_subcommand_from clone colocation export fetch import init push remote root" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand git; and not __fish_seen_subcommand_from clone colocation export fetch import init push remote root" -f -a "clone" -d 'Create a new repo backed by a clone of a Git repo'
complete -c jj -n "__fish_jj_using_subcommand git; and not __fish_seen_subcommand_from clone colocation export fetch import init push remote root" -f -a "colocation" -d 'Manage Jujutsu repository colocation with Git'
complete -c jj -n "__fish_jj_using_subcommand git; and not __fish_seen_subcommand_from clone colocation export fetch import init push remote root" -f -a "export" -d 'Update the underlying Git repo with changes made in the repo'
complete -c jj -n "__fish_jj_using_subcommand git; and not __fish_seen_subcommand_from clone colocation export fetch import init push remote root" -f -a "fetch" -d 'Fetch from a Git remote'
complete -c jj -n "__fish_jj_using_subcommand git; and not __fish_seen_subcommand_from clone colocation export fetch import init push remote root" -f -a "import" -d 'Update repo with changes made in the underlying Git repo'
complete -c jj -n "__fish_jj_using_subcommand git; and not __fish_seen_subcommand_from clone colocation export fetch import init push remote root" -f -a "init" -d 'Create a new Git backed repo'
complete -c jj -n "__fish_jj_using_subcommand git; and not __fish_seen_subcommand_from clone colocation export fetch import init push remote root" -f -a "push" -d 'Push to a Git remote'
complete -c jj -n "__fish_jj_using_subcommand git; and not __fish_seen_subcommand_from clone colocation export fetch import init push remote root" -f -a "remote" -d 'Manage Git remotes'
complete -c jj -n "__fish_jj_using_subcommand git; and not __fish_seen_subcommand_from clone colocation export fetch import init push remote root" -f -a "root" -d 'Show the underlying Git directory of a repository using the Git backend'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from clone" -l remote -d 'Name of the newly created remote' -r
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from clone" -l depth -d 'Create a shallow clone of the given depth' -r
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from clone" -s b -l branch -d 'Name of the branch to fetch and use as the parent of the working-copy change (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from clone" -s t -l tag -d 'Fetch only some of the tags (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from clone" -l object-hash -d 'Object hash algorithm for the local Git repository' -r -f -a "sha1\t''
sha256\t''"
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from clone" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from clone" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from clone" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from clone" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from clone" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from clone" -l colocate -d 'Colocate the Jujutsu repo with the git repo'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from clone" -l no-colocate -d 'Disable colocation of the Jujutsu repo with the git repo'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from clone" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from clone" -l no-integrate-operation -d 'Run the command as usual but don\'t integrate any operations'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from clone" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from clone" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from clone" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from clone" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from clone" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from colocation" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from colocation" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from colocation" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from colocation" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from colocation" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from colocation" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from colocation" -l no-integrate-operation -d 'Run the command as usual but don\'t integrate any operations'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from colocation" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from colocation" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from colocation" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from colocation" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from colocation" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from colocation" -f -a "disable" -d 'Convert into a non-colocated Jujutsu/Git repository'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from colocation" -f -a "enable" -d 'Convert into a colocated Jujutsu/Git repository'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from colocation" -f -a "status" -d 'Show the current colocation status'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from export" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from export" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from export" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from export" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from export" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from export" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from export" -l no-integrate-operation -d 'Run the command as usual but don\'t integrate any operations'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from export" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from export" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from export" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from export" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from export" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from fetch" -s b -l branch -d 'Name of the branch to fetch (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from fetch" -s t -l tag -d 'Fetch only some of the tags (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from fetch" -l remote -d 'The remote to fetch from (only named remotes are supported, can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from fetch" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from fetch" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from fetch" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from fetch" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from fetch" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from fetch" -l tracked -d 'Fetch only tracked bookmarks and tags'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from fetch" -l all-remotes -d 'Fetch from all remotes'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from fetch" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from fetch" -l no-integrate-operation -d 'Run the command as usual but don\'t integrate any operations'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from fetch" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from fetch" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from fetch" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from fetch" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from fetch" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from import" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from import" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from import" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from import" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from import" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from import" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from import" -l no-integrate-operation -d 'Run the command as usual but don\'t integrate any operations'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from import" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from import" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from import" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from import" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from import" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from init" -l object-hash -d 'Object hash algorithm for the newly created Git repository' -r -f -a "sha1\t''
sha256\t''"
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from init" -l git-repo -d 'Specifies a path to an **existing** git repository to be used as the backing git repo for the newly created `jj` repo' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from init" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from init" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from init" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from init" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from init" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from init" -l colocate -d 'Colocate the Jujutsu repo with the git repo'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from init" -l no-colocate -d 'Disable colocation of the Jujutsu repo with the git repo'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from init" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from init" -l no-integrate-operation -d 'Run the command as usual but don\'t integrate any operations'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from init" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from init" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from init" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from init" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from init" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from push" -l remote -d 'The remote to push to (only named remotes are supported)' -r
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from push" -s b -l bookmark -d 'Push only this bookmark, or bookmarks matching a pattern (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from push" -s t -l tag -d 'Push only this tag, or tags matching a pattern (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from push" -s r -l revision -d 'Push bookmarks and tags pointing to these commits (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from push" -s c -l change -d 'Push this commit by creating a bookmark (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from push" -l named -d 'Specify a new bookmark name and a revision to push under that name, e.g. \'--named myfeature=@\'' -r
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from push" -s o -l option -d 'Git push options' -r
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from push" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from push" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from push" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from push" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from push" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from push" -l all -d 'Push all bookmarks and tags (including new ones)'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from push" -l tracked -d 'Push all tracked bookmarks and tags'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from push" -l deleted -d 'Push all deleted bookmarks and tags'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from push" -l allow-empty-description -d 'Allow pushing commits with empty descriptions'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from push" -l allow-private -d 'Allow pushing commits that are private'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from push" -l allow-conflicts -d 'Allow pushing commits that contain conflicts'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from push" -l dry-run -d 'Only display what will change on the remote'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from push" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from push" -l no-integrate-operation -d 'Run the command as usual but don\'t integrate any operations'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from push" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from push" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from push" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from push" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from push" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from remote" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from remote" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from remote" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from remote" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from remote" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from remote" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from remote" -l no-integrate-operation -d 'Run the command as usual but don\'t integrate any operations'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from remote" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from remote" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from remote" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from remote" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from remote" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from remote" -f -a "add" -d 'Add a Git remote'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from remote" -f -a "list" -d 'List Git remotes'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from remote" -f -a "remove" -d 'Remove a Git remote and forget its bookmarks'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from remote" -f -a "rename" -d 'Rename a Git remote'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from remote" -f -a "set-url" -d 'Set the URL of a Git remote'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from root" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from root" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from root" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from root" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from root" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from root" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from root" -l no-integrate-operation -d 'Run the command as usual but don\'t integrate any operations'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from root" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from root" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from root" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from root" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from root" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand help" -s k -l keyword -d 'Show help for keywords instead of commands' -r -f -a "bookmarks\t'Named pointers to revisions (similar to Git\'s branches)'
config\t'How and where to set configuration options'
filesets\t'A functional language for selecting a set of files'
glossary\t'Definitions of various terms'
revsets\t'A functional language for selecting a set of revision'
templates\t'A functional language to customize command output'
tutorial\t'Show a tutorial to get started with jj'"
complete -c jj -n "__fish_jj_using_subcommand help" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand help" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand help" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand help" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand help" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand help" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand help" -l no-integrate-operation -d 'Run the command as usual but don\'t integrate any operations'
complete -c jj -n "__fish_jj_using_subcommand help" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand help" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand help" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand help" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand help" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand interdiff" -s f -l from -d 'The first revision to compare (default: @)' -r
complete -c jj -n "__fish_jj_using_subcommand interdiff" -s t -l to -d 'The second revision to compare (default: @)' -r
complete -c jj -n "__fish_jj_using_subcommand interdiff" -l tool -d 'Generate diff by external command' -r
complete -c jj -n "__fish_jj_using_subcommand interdiff" -l context -d 'Number of lines of context to show' -r
complete -c jj -n "__fish_jj_using_subcommand interdiff" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand interdiff" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand interdiff" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand interdiff" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand interdiff" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand interdiff" -s s -l summary -d 'For each path, show only whether it was modified, added, or deleted'
complete -c jj -n "__fish_jj_using_subcommand interdiff" -l stat -d 'Show a histogram of the changes'
complete -c jj -n "__fish_jj_using_subcommand interdiff" -l types -d 'For each path, show only its type before and after'
complete -c jj -n "__fish_jj_using_subcommand interdiff" -l name-only -d 'For each path, show only its path'
complete -c jj -n "__fish_jj_using_subcommand interdiff" -l git -d 'Show a Git-format diff'
complete -c jj -n "__fish_jj_using_subcommand interdiff" -l color-words -d 'Show a word-level diff with changes indicated only by color'
complete -c jj -n "__fish_jj_using_subcommand interdiff" -s w -l ignore-all-space -d 'Ignore whitespace when comparing lines'
complete -c jj -n "__fish_jj_using_subcommand interdiff" -s b -l ignore-space-change -d 'Ignore changes in amount of whitespace when comparing lines'
complete -c jj -n "__fish_jj_using_subcommand interdiff" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand interdiff" -l no-integrate-operation -d 'Run the command as usual but don\'t integrate any operations'
complete -c jj -n "__fish_jj_using_subcommand interdiff" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand interdiff" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand interdiff" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand interdiff" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand interdiff" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand log" -s r -l revision -d 'Which revisions to show' -r
complete -c jj -n "__fish_jj_using_subcommand log" -s n -l limit -d 'Limit number of revisions to show' -r
complete -c jj -n "__fish_jj_using_subcommand log" -s T -l template -d 'Render each revision using the given template' -r
complete -c jj -n "__fish_jj_using_subcommand log" -l tool -d 'Generate diff by external command' -r
complete -c jj -n "__fish_jj_using_subcommand log" -l context -d 'Number of lines of context to show' -r
complete -c jj -n "__fish_jj_using_subcommand log" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand log" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand log" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand log" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand log" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand log" -l reversed -d 'Show revisions in the opposite order (older revisions first)'
complete -c jj -n "__fish_jj_using_subcommand log" -s G -l no-graph -d 'Show a flat list of revisions instead of a graph'
complete -c jj -n "__fish_jj_using_subcommand log" -s p -l patch -d 'Show patch'
complete -c jj -n "__fish_jj_using_subcommand log" -l count -d 'Print the number of commits instead of showing them'
complete -c jj -n "__fish_jj_using_subcommand log" -s s -l summary -d 'For each path, show only whether it was modified, added, or deleted'
complete -c jj -n "__fish_jj_using_subcommand log" -l stat -d 'Show a histogram of the changes'
complete -c jj -n "__fish_jj_using_subcommand log" -l types -d 'For each path, show only its type before and after'
complete -c jj -n "__fish_jj_using_subcommand log" -l name-only -d 'For each path, show only its path'
complete -c jj -n "__fish_jj_using_subcommand log" -l git -d 'Show a Git-format diff'
complete -c jj -n "__fish_jj_using_subcommand log" -l color-words -d 'Show a word-level diff with changes indicated only by color'
complete -c jj -n "__fish_jj_using_subcommand log" -l ignore-all-space -d 'Ignore whitespace when comparing lines'
complete -c jj -n "__fish_jj_using_subcommand log" -l ignore-space-change -d 'Ignore changes in amount of whitespace when comparing lines'
complete -c jj -n "__fish_jj_using_subcommand log" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand log" -l no-integrate-operation -d 'Run the command as usual but don\'t integrate any operations'
complete -c jj -n "__fish_jj_using_subcommand log" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand log" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand log" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand log" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand log" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand metaedit" -s r -r
complete -c jj -n "__fish_jj_using_subcommand metaedit" -s m -l message -d 'Update the change description' -r
complete -c jj -n "__fish_jj_using_subcommand metaedit" -l author -d 'Set author to the provided string' -r
complete -c jj -n "__fish_jj_using_subcommand metaedit" -l author-timestamp -d 'Set the author date to the given date' -r
complete -c jj -n "__fish_jj_using_subcommand metaedit" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand metaedit" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand metaedit" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand metaedit" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand metaedit" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand metaedit" -l update-change-id -d 'Generate a new change-id'
complete -c jj -n "__fish_jj_using_subcommand metaedit" -l update-author-timestamp -d 'Update the author timestamp'
complete -c jj -n "__fish_jj_using_subcommand metaedit" -l update-author -d 'Update the author to the configured user'
complete -c jj -n "__fish_jj_using_subcommand metaedit" -l force-rewrite -d 'Rewrite the commit, even if no other metadata changed'
complete -c jj -n "__fish_jj_using_subcommand metaedit" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand metaedit" -l no-integrate-operation -d 'Run the command as usual but don\'t integrate any operations'
complete -c jj -n "__fish_jj_using_subcommand metaedit" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand metaedit" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand metaedit" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand metaedit" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand metaedit" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand new" -s o -r
complete -c jj -n "__fish_jj_using_subcommand new" -s m -l message -d 'The change description to use' -r
complete -c jj -n "__fish_jj_using_subcommand new" -s A -l insert-after -l after -d 'Insert the new change after the given commit(s)' -r
complete -c jj -n "__fish_jj_using_subcommand new" -s B -l insert-before -l before -d 'Insert the new change before the given commit(s)' -r
complete -c jj -n "__fish_jj_using_subcommand new" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand new" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand new" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand new" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand new" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand new" -l no-edit -d 'Do not edit the newly created change'
complete -c jj -n "__fish_jj_using_subcommand new" -l edit -d 'No-op flag to pair with --no-edit'
complete -c jj -n "__fish_jj_using_subcommand new" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand new" -l no-integrate-operation -d 'Run the command as usual but don\'t integrate any operations'
complete -c jj -n "__fish_jj_using_subcommand new" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand new" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand new" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand new" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand new" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand next" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand next" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand next" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand next" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand next" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand next" -s e -l edit -d 'Instead of creating a new working-copy commit on top of the target commit (like `jj new`), edit the target commit directly (like `jj edit`)'
complete -c jj -n "__fish_jj_using_subcommand next" -s n -l no-edit -d 'The inverse of `--edit`'
complete -c jj -n "__fish_jj_using_subcommand next" -l conflict -d 'Jump to the next conflicted descendant'
complete -c jj -n "__fish_jj_using_subcommand next" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand next" -l no-integrate-operation -d 'Run the command as usual but don\'t integrate any operations'
complete -c jj -n "__fish_jj_using_subcommand next" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand next" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand next" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand next" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand next" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand operation; and not __fish_seen_subcommand_from abandon diff integrate log restore revert show" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand operation; and not __fish_seen_subcommand_from abandon diff integrate log restore revert show" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand operation; and not __fish_seen_subcommand_from abandon diff integrate log restore revert show" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand operation; and not __fish_seen_subcommand_from abandon diff integrate log restore revert show" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand operation; and not __fish_seen_subcommand_from abandon diff integrate log restore revert show" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand operation; and not __fish_seen_subcommand_from abandon diff integrate log restore revert show" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand operation; and not __fish_seen_subcommand_from abandon diff integrate log restore revert show" -l no-integrate-operation -d 'Run the command as usual but don\'t integrate any operations'
complete -c jj -n "__fish_jj_using_subcommand operation; and not __fish_seen_subcommand_from abandon diff integrate log restore revert show" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand operation; and not __fish_seen_subcommand_from abandon diff integrate log restore revert show" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand operation; and not __fish_seen_subcommand_from abandon diff integrate log restore revert show" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand operation; and not __fish_seen_subcommand_from abandon diff integrate log restore revert show" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand operation; and not __fish_seen_subcommand_from abandon diff integrate log restore revert show" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand operation; and not __fish_seen_subcommand_from abandon diff integrate log restore revert show" -f -a "abandon" -d 'Abandon operation history'
complete -c jj -n "__fish_jj_using_subcommand operation; and not __fish_seen_subcommand_from abandon diff integrate log restore revert show" -f -a "diff" -d 'Compare changes to the repository between two operations'
complete -c jj -n "__fish_jj_using_subcommand operation; and not __fish_seen_subcommand_from abandon diff integrate log restore revert show" -f -a "integrate" -d 'Make an operation part of the operation log'
complete -c jj -n "__fish_jj_using_subcommand operation; and not __fish_seen_subcommand_from abandon diff integrate log restore revert show" -f -a "log" -d 'Show the operation log'
complete -c jj -n "__fish_jj_using_subcommand operation; and not __fish_seen_subcommand_from abandon diff integrate log restore revert show" -f -a "restore" -d 'Create a new operation that restores the repo to an earlier state'
complete -c jj -n "__fish_jj_using_subcommand operation; and not __fish_seen_subcommand_from abandon diff integrate log restore revert show" -f -a "revert" -d 'Create a new operation that reverts an earlier operation'
complete -c jj -n "__fish_jj_using_subcommand operation; and not __fish_seen_subcommand_from abandon diff integrate log restore revert show" -f -a "show" -d 'Show changes to the repository in an operation'
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from abandon" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from abandon" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from abandon" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from abandon" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from abandon" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from abandon" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from abandon" -l no-integrate-operation -d 'Run the command as usual but don\'t integrate any operations'
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from abandon" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from abandon" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from abandon" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from abandon" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from abandon" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from diff" -l operation -l op -d 'Show repository changes in this operation, compared to its parent' -r
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from diff" -s f -l from -d 'Show repository changes from this operation' -r
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from diff" -s t -l to -d 'Show repository changes to this operation' -r
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from diff" -l tool -d 'Generate diff by external command' -r
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from diff" -l context -d 'Number of lines of context to show' -r
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from diff" -l show-changes-in -d 'Show only changed revisions matching the given revset expression' -r
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from diff" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from diff" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from diff" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from diff" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from diff" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from diff" -s G -l no-graph -d 'Show a flat list of modified changes instead of a graph'
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from diff" -s p -l patch -d 'Show patch of modifications to changes'
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from diff" -s s -l summary -d 'For each path, show only whether it was modified, added, or deleted'
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from diff" -l stat -d 'Show a histogram of the changes'
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from diff" -l types -d 'For each path, show only its type before and after'
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from diff" -l name-only -d 'For each path, show only its path'
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from diff" -l git -d 'Show a Git-format diff'
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from diff" -l color-words -d 'Show a word-level diff with changes indicated only by color'
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from diff" -l ignore-all-space -d 'Ignore whitespace when comparing lines'
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from diff" -l ignore-space-change -d 'Ignore changes in amount of whitespace when comparing lines'
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from diff" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from diff" -l no-integrate-operation -d 'Run the command as usual but don\'t integrate any operations'
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from diff" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from diff" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from diff" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from diff" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from diff" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from integrate" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from integrate" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from integrate" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from integrate" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from integrate" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from integrate" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from integrate" -l no-integrate-operation -d 'Run the command as usual but don\'t integrate any operations'
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from integrate" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from integrate" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from integrate" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from integrate" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from integrate" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from log" -s n -l limit -d 'Limit number of operations to show' -r
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from log" -s T -l template -d 'Render each operation using the given template' -r
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from log" -l tool -d 'Generate diff by external command' -r
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from log" -l context -d 'Number of lines of context to show' -r
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from log" -l show-changes-in -d 'Show only changed revisions matching the given revset expression' -r
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from log" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from log" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from log" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from log" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from log" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from log" -l reversed -d 'Show operations in the opposite order (older operations first)'
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from log" -s G -l no-graph -d 'Show a flat list of operations instead of a graph'
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from log" -s d -l op-diff -d 'Show changes to the repository at each operation'
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from log" -s p -l patch -d 'Show patch of modifications to changes (implies --op-diff)'
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from log" -s s -l summary -d 'For each path, show only whether it was modified, added, or deleted'
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from log" -l stat -d 'Show a histogram of the changes'
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from log" -l types -d 'For each path, show only its type before and after'
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from log" -l name-only -d 'For each path, show only its path'
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from log" -l git -d 'Show a Git-format diff'
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from log" -l color-words -d 'Show a word-level diff with changes indicated only by color'
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from log" -l ignore-all-space -d 'Ignore whitespace when comparing lines'
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from log" -l ignore-space-change -d 'Ignore changes in amount of whitespace when comparing lines'
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from log" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from log" -l no-integrate-operation -d 'Run the command as usual but don\'t integrate any operations'
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from log" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from log" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from log" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from log" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from log" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from restore" -l what -d 'What portions of the local state to restore (can be repeated)' -r -f -a "repo\t'The jj repo state and local bookmarks'
remote-tracking\t'The remote-tracking bookmarks. Do not restore these if you\'d like to push after the undo'"
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from restore" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from restore" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from restore" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from restore" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from restore" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from restore" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from restore" -l no-integrate-operation -d 'Run the command as usual but don\'t integrate any operations'
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from restore" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from restore" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from restore" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from restore" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from restore" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from revert" -l what -d 'What portions of the local state to restore (can be repeated)' -r -f -a "repo\t'The jj repo state and local bookmarks'
remote-tracking\t'The remote-tracking bookmarks. Do not restore these if you\'d like to push after the undo'"
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from revert" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from revert" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from revert" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from revert" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from revert" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from revert" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from revert" -l no-integrate-operation -d 'Run the command as usual but don\'t integrate any operations'
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from revert" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from revert" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from revert" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from revert" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from revert" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from show" -s T -l template -d 'Render the operation using the given template' -r
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from show" -l tool -d 'Generate diff by external command' -r
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from show" -l context -d 'Number of lines of context to show' -r
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from show" -l show-changes-in -d 'Show only changed revisions matching the given revset expression' -r
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from show" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from show" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from show" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from show" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from show" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from show" -s G -l no-graph -d 'Show a flat list of modified changes instead of a graph'
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from show" -s p -l patch -d 'Show patch of modifications to changes'
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from show" -l no-op-diff -d 'Do not show operation diff'
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from show" -s s -l summary -d 'For each path, show only whether it was modified, added, or deleted'
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from show" -l stat -d 'Show a histogram of the changes'
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from show" -l types -d 'For each path, show only its type before and after'
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from show" -l name-only -d 'For each path, show only its path'
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from show" -l git -d 'Show a Git-format diff'
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from show" -l color-words -d 'Show a word-level diff with changes indicated only by color'
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from show" -l ignore-all-space -d 'Ignore whitespace when comparing lines'
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from show" -l ignore-space-change -d 'Ignore changes in amount of whitespace when comparing lines'
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from show" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from show" -l no-integrate-operation -d 'Run the command as usual but don\'t integrate any operations'
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from show" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from show" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from show" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from show" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand operation; and __fish_seen_subcommand_from show" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand op; and not __fish_seen_subcommand_from abandon diff integrate log restore revert show" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand op; and not __fish_seen_subcommand_from abandon diff integrate log restore revert show" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand op; and not __fish_seen_subcommand_from abandon diff integrate log restore revert show" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand op; and not __fish_seen_subcommand_from abandon diff integrate log restore revert show" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand op; and not __fish_seen_subcommand_from abandon diff integrate log restore revert show" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand op; and not __fish_seen_subcommand_from abandon diff integrate log restore revert show" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand op; and not __fish_seen_subcommand_from abandon diff integrate log restore revert show" -l no-integrate-operation -d 'Run the command as usual but don\'t integrate any operations'
complete -c jj -n "__fish_jj_using_subcommand op; and not __fish_seen_subcommand_from abandon diff integrate log restore revert show" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand op; and not __fish_seen_subcommand_from abandon diff integrate log restore revert show" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand op; and not __fish_seen_subcommand_from abandon diff integrate log restore revert show" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand op; and not __fish_seen_subcommand_from abandon diff integrate log restore revert show" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand op; and not __fish_seen_subcommand_from abandon diff integrate log restore revert show" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand op; and not __fish_seen_subcommand_from abandon diff integrate log restore revert show" -f -a "abandon" -d 'Abandon operation history'
complete -c jj -n "__fish_jj_using_subcommand op; and not __fish_seen_subcommand_from abandon diff integrate log restore revert show" -f -a "diff" -d 'Compare changes to the repository between two operations'
complete -c jj -n "__fish_jj_using_subcommand op; and not __fish_seen_subcommand_from abandon diff integrate log restore revert show" -f -a "integrate" -d 'Make an operation part of the operation log'
complete -c jj -n "__fish_jj_using_subcommand op; and not __fish_seen_subcommand_from abandon diff integrate log restore revert show" -f -a "log" -d 'Show the operation log'
complete -c jj -n "__fish_jj_using_subcommand op; and not __fish_seen_subcommand_from abandon diff integrate log restore revert show" -f -a "restore" -d 'Create a new operation that restores the repo to an earlier state'
complete -c jj -n "__fish_jj_using_subcommand op; and not __fish_seen_subcommand_from abandon diff integrate log restore revert show" -f -a "revert" -d 'Create a new operation that reverts an earlier operation'
complete -c jj -n "__fish_jj_using_subcommand op; and not __fish_seen_subcommand_from abandon diff integrate log restore revert show" -f -a "show" -d 'Show changes to the repository in an operation'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from abandon" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from abandon" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from abandon" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from abandon" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from abandon" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from abandon" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from abandon" -l no-integrate-operation -d 'Run the command as usual but don\'t integrate any operations'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from abandon" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from abandon" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from abandon" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from abandon" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from abandon" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from diff" -l operation -l op -d 'Show repository changes in this operation, compared to its parent' -r
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from diff" -s f -l from -d 'Show repository changes from this operation' -r
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from diff" -s t -l to -d 'Show repository changes to this operation' -r
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from diff" -l tool -d 'Generate diff by external command' -r
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from diff" -l context -d 'Number of lines of context to show' -r
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from diff" -l show-changes-in -d 'Show only changed revisions matching the given revset expression' -r
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from diff" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from diff" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from diff" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from diff" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from diff" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from diff" -s G -l no-graph -d 'Show a flat list of modified changes instead of a graph'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from diff" -s p -l patch -d 'Show patch of modifications to changes'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from diff" -s s -l summary -d 'For each path, show only whether it was modified, added, or deleted'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from diff" -l stat -d 'Show a histogram of the changes'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from diff" -l types -d 'For each path, show only its type before and after'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from diff" -l name-only -d 'For each path, show only its path'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from diff" -l git -d 'Show a Git-format diff'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from diff" -l color-words -d 'Show a word-level diff with changes indicated only by color'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from diff" -l ignore-all-space -d 'Ignore whitespace when comparing lines'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from diff" -l ignore-space-change -d 'Ignore changes in amount of whitespace when comparing lines'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from diff" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from diff" -l no-integrate-operation -d 'Run the command as usual but don\'t integrate any operations'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from diff" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from diff" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from diff" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from diff" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from diff" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from integrate" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from integrate" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from integrate" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from integrate" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from integrate" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from integrate" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from integrate" -l no-integrate-operation -d 'Run the command as usual but don\'t integrate any operations'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from integrate" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from integrate" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from integrate" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from integrate" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from integrate" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from log" -s n -l limit -d 'Limit number of operations to show' -r
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from log" -s T -l template -d 'Render each operation using the given template' -r
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from log" -l tool -d 'Generate diff by external command' -r
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from log" -l context -d 'Number of lines of context to show' -r
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from log" -l show-changes-in -d 'Show only changed revisions matching the given revset expression' -r
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from log" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from log" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from log" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from log" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from log" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from log" -l reversed -d 'Show operations in the opposite order (older operations first)'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from log" -s G -l no-graph -d 'Show a flat list of operations instead of a graph'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from log" -s d -l op-diff -d 'Show changes to the repository at each operation'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from log" -s p -l patch -d 'Show patch of modifications to changes (implies --op-diff)'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from log" -s s -l summary -d 'For each path, show only whether it was modified, added, or deleted'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from log" -l stat -d 'Show a histogram of the changes'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from log" -l types -d 'For each path, show only its type before and after'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from log" -l name-only -d 'For each path, show only its path'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from log" -l git -d 'Show a Git-format diff'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from log" -l color-words -d 'Show a word-level diff with changes indicated only by color'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from log" -l ignore-all-space -d 'Ignore whitespace when comparing lines'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from log" -l ignore-space-change -d 'Ignore changes in amount of whitespace when comparing lines'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from log" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from log" -l no-integrate-operation -d 'Run the command as usual but don\'t integrate any operations'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from log" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from log" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from log" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from log" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from log" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from restore" -l what -d 'What portions of the local state to restore (can be repeated)' -r -f -a "repo\t'The jj repo state and local bookmarks'
remote-tracking\t'The remote-tracking bookmarks. Do not restore these if you\'d like to push after the undo'"
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from restore" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from restore" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from restore" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from restore" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from restore" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from restore" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from restore" -l no-integrate-operation -d 'Run the command as usual but don\'t integrate any operations'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from restore" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from restore" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from restore" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from restore" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from restore" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from revert" -l what -d 'What portions of the local state to restore (can be repeated)' -r -f -a "repo\t'The jj repo state and local bookmarks'
remote-tracking\t'The remote-tracking bookmarks. Do not restore these if you\'d like to push after the undo'"
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from revert" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from revert" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from revert" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from revert" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from revert" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from revert" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from revert" -l no-integrate-operation -d 'Run the command as usual but don\'t integrate any operations'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from revert" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from revert" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from revert" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from revert" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from revert" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from show" -s T -l template -d 'Render the operation using the given template' -r
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from show" -l tool -d 'Generate diff by external command' -r
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from show" -l context -d 'Number of lines of context to show' -r
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from show" -l show-changes-in -d 'Show only changed revisions matching the given revset expression' -r
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from show" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from show" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from show" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from show" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from show" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from show" -s G -l no-graph -d 'Show a flat list of modified changes instead of a graph'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from show" -s p -l patch -d 'Show patch of modifications to changes'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from show" -l no-op-diff -d 'Do not show operation diff'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from show" -s s -l summary -d 'For each path, show only whether it was modified, added, or deleted'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from show" -l stat -d 'Show a histogram of the changes'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from show" -l types -d 'For each path, show only its type before and after'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from show" -l name-only -d 'For each path, show only its path'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from show" -l git -d 'Show a Git-format diff'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from show" -l color-words -d 'Show a word-level diff with changes indicated only by color'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from show" -l ignore-all-space -d 'Ignore whitespace when comparing lines'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from show" -l ignore-space-change -d 'Ignore changes in amount of whitespace when comparing lines'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from show" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from show" -l no-integrate-operation -d 'Run the command as usual but don\'t integrate any operations'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from show" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from show" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from show" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from show" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from show" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand parallelize" -s r -r
complete -c jj -n "__fish_jj_using_subcommand parallelize" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand parallelize" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand parallelize" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand parallelize" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand parallelize" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand parallelize" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand parallelize" -l no-integrate-operation -d 'Run the command as usual but don\'t integrate any operations'
complete -c jj -n "__fish_jj_using_subcommand parallelize" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand parallelize" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand parallelize" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand parallelize" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand parallelize" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand prev" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand prev" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand prev" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand prev" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand prev" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand prev" -s e -l edit -d 'Edit the parent directly, instead of moving the working-copy commit'
complete -c jj -n "__fish_jj_using_subcommand prev" -s n -l no-edit -d 'The inverse of `--edit`'
complete -c jj -n "__fish_jj_using_subcommand prev" -l conflict -d 'Jump to the previous conflicted ancestor'
complete -c jj -n "__fish_jj_using_subcommand prev" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand prev" -l no-integrate-operation -d 'Run the command as usual but don\'t integrate any operations'
complete -c jj -n "__fish_jj_using_subcommand prev" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand prev" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand prev" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand prev" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand prev" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand rebase" -s b -l branch -d 'Rebase the whole branch relative to destination\'s ancestors (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand rebase" -s s -l source -d 'Rebase specified revision(s) together with their trees of descendants (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand rebase" -s r -l revision -d 'Rebase the given revisions, rebasing descendants onto this revision\'s parent(s)' -r
complete -c jj -n "__fish_jj_using_subcommand rebase" -s o -s d -l onto -l destination -d 'The revision(s) to rebase onto (can be repeated to create a merge commit)' -r
complete -c jj -n "__fish_jj_using_subcommand rebase" -s A -l insert-after -l after -d 'The revision(s) to insert after (can be repeated to create a merge commit)' -r
complete -c jj -n "__fish_jj_using_subcommand rebase" -s B -l insert-before -l before -d 'The revision(s) to insert before (can be repeated to create a merge commit)' -r
complete -c jj -n "__fish_jj_using_subcommand rebase" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand rebase" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand rebase" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand rebase" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand rebase" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand rebase" -l skip-emptied -d 'If true, when rebasing would produce an empty commit, the commit is abandoned. It will not be abandoned if it was already empty before the rebase. Will never skip merge commits with multiple non-empty parents'
complete -c jj -n "__fish_jj_using_subcommand rebase" -l keep-divergent -d 'Keep divergent commits while rebasing'
complete -c jj -n "__fish_jj_using_subcommand rebase" -l simplify-parents -d 'Simplify parents of rebased commits, like `jj simplify-parents`, while rebasing them. Any parents that are ancestors of other parents will be removed'
complete -c jj -n "__fish_jj_using_subcommand rebase" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand rebase" -l no-integrate-operation -d 'Run the command as usual but don\'t integrate any operations'
complete -c jj -n "__fish_jj_using_subcommand rebase" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand rebase" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand rebase" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand rebase" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand rebase" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand redo" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand redo" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand redo" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand redo" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand redo" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand redo" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand redo" -l no-integrate-operation -d 'Run the command as usual but don\'t integrate any operations'
complete -c jj -n "__fish_jj_using_subcommand redo" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand redo" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand redo" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand redo" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand redo" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand resolve" -s r -l revision -r
complete -c jj -n "__fish_jj_using_subcommand resolve" -l tool -d 'Specify 3-way merge tool to be used' -r
complete -c jj -n "__fish_jj_using_subcommand resolve" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand resolve" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand resolve" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand resolve" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand resolve" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand resolve" -s l -l list -d 'Instead of resolving conflicts, list all the conflicts'
complete -c jj -n "__fish_jj_using_subcommand resolve" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand resolve" -l no-integrate-operation -d 'Run the command as usual but don\'t integrate any operations'
complete -c jj -n "__fish_jj_using_subcommand resolve" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand resolve" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand resolve" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand resolve" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand resolve" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand restore" -s f -l from -d 'Revision to restore from (source)' -r
complete -c jj -n "__fish_jj_using_subcommand restore" -s t -l into -l to -d 'Revision to restore into (destination)' -r
complete -c jj -n "__fish_jj_using_subcommand restore" -s c -l changes-in -d 'Undo the changes in a revision as compared to the merge of its parents' -r
complete -c jj -n "__fish_jj_using_subcommand restore" -s r -l revision -d 'Prints an error. DO NOT USE' -r
complete -c jj -n "__fish_jj_using_subcommand restore" -l tool -d 'Specify diff editor to be used (implies --interactive)' -r
complete -c jj -n "__fish_jj_using_subcommand restore" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand restore" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand restore" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand restore" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand restore" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand restore" -s i -l interactive -d 'Interactively choose which parts to restore'
complete -c jj -n "__fish_jj_using_subcommand restore" -l restore-descendants -d 'Preserve the content (not the diff) when rebasing descendants'
complete -c jj -n "__fish_jj_using_subcommand restore" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand restore" -l no-integrate-operation -d 'Run the command as usual but don\'t integrate any operations'
complete -c jj -n "__fish_jj_using_subcommand restore" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand restore" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand restore" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand restore" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand restore" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand revert" -s r -l revision -d 'The revision(s) to apply the reverse of' -r
complete -c jj -n "__fish_jj_using_subcommand revert" -s o -s d -l onto -l destination -d 'The revision(s) to apply the reverse changes on top of' -r
complete -c jj -n "__fish_jj_using_subcommand revert" -s A -l insert-after -l after -d 'The revision(s) to insert the reverse changes after (can be repeated to create a merge commit)' -r
complete -c jj -n "__fish_jj_using_subcommand revert" -s B -l insert-before -l before -d 'The revision(s) to insert the reverse changes before (can be repeated to create a merge commit)' -r
complete -c jj -n "__fish_jj_using_subcommand revert" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand revert" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand revert" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand revert" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand revert" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand revert" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand revert" -l no-integrate-operation -d 'Run the command as usual but don\'t integrate any operations'
complete -c jj -n "__fish_jj_using_subcommand revert" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand revert" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand revert" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand revert" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand revert" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand root" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand root" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand root" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand root" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand root" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand root" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand root" -l no-integrate-operation -d 'Run the command as usual but don\'t integrate any operations'
complete -c jj -n "__fish_jj_using_subcommand root" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand root" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand root" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand root" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand root" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand run" -s r -l revision -d 'The revisions to change' -r
complete -c jj -n "__fish_jj_using_subcommand run" -s j -l jobs -d 'How many processes should run in parallel' -r
complete -c jj -n "__fish_jj_using_subcommand run" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand run" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand run" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand run" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand run" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand run" -s x -d 'A no-op option to match the interface of `git rebase -x`'
complete -c jj -n "__fish_jj_using_subcommand run" -l root -d 'Run the command from the working-copy root in each commit instead of from the subdirectory `jj run` was invoked from'
complete -c jj -n "__fish_jj_using_subcommand run" -l clean -d 'Delete each working copy before running the command'
complete -c jj -n "__fish_jj_using_subcommand run" -l restore-descendants -d 'Preserve the content (not the diff) when rebasing descendants'
complete -c jj -n "__fish_jj_using_subcommand run" -l passthrough -d 'Pass through stdout and stderr directly to the terminal'
complete -c jj -n "__fish_jj_using_subcommand run" -l ignore-changes -d 'Run the command without rewriting any commits'
complete -c jj -n "__fish_jj_using_subcommand run" -l ignore-errors -d 'Continue with remaining revisions when a command\'s exit code indicates failure'
complete -c jj -n "__fish_jj_using_subcommand run" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand run" -l no-integrate-operation -d 'Run the command as usual but don\'t integrate any operations'
complete -c jj -n "__fish_jj_using_subcommand run" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand run" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand run" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand run" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand run" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand show" -s r -r
complete -c jj -n "__fish_jj_using_subcommand show" -s T -l template -d 'Render each revision using the given template' -r
complete -c jj -n "__fish_jj_using_subcommand show" -l tool -d 'Generate diff by external command' -r
complete -c jj -n "__fish_jj_using_subcommand show" -l context -d 'Number of lines of context to show' -r
complete -c jj -n "__fish_jj_using_subcommand show" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand show" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand show" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand show" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand show" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand show" -l reversed -d 'Show revisions in the opposite order (older revisions first)'
complete -c jj -n "__fish_jj_using_subcommand show" -s s -l summary -d 'For each path, show only whether it was modified, added, or deleted'
complete -c jj -n "__fish_jj_using_subcommand show" -l stat -d 'Show a histogram of the changes'
complete -c jj -n "__fish_jj_using_subcommand show" -l types -d 'For each path, show only its type before and after'
complete -c jj -n "__fish_jj_using_subcommand show" -l name-only -d 'For each path, show only its path'
complete -c jj -n "__fish_jj_using_subcommand show" -l git -d 'Show a Git-format diff'
complete -c jj -n "__fish_jj_using_subcommand show" -l color-words -d 'Show a word-level diff with changes indicated only by color'
complete -c jj -n "__fish_jj_using_subcommand show" -l no-patch -d 'Do not show the patch'
complete -c jj -n "__fish_jj_using_subcommand show" -s w -l ignore-all-space -d 'Ignore whitespace when comparing lines'
complete -c jj -n "__fish_jj_using_subcommand show" -s b -l ignore-space-change -d 'Ignore changes in amount of whitespace when comparing lines'
complete -c jj -n "__fish_jj_using_subcommand show" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand show" -l no-integrate-operation -d 'Run the command as usual but don\'t integrate any operations'
complete -c jj -n "__fish_jj_using_subcommand show" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand show" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand show" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand show" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand show" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand sign" -s r -l revision -d 'What revision(s) to sign' -r
complete -c jj -n "__fish_jj_using_subcommand sign" -l key -d 'The key used for signing' -r
complete -c jj -n "__fish_jj_using_subcommand sign" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand sign" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand sign" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand sign" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand sign" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand sign" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand sign" -l no-integrate-operation -d 'Run the command as usual but don\'t integrate any operations'
complete -c jj -n "__fish_jj_using_subcommand sign" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand sign" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand sign" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand sign" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand sign" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand simplify-parents" -s s -l source -d 'Simplify specified revision(s) together with their trees of descendants (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand simplify-parents" -s r -l revision -d 'Simplify specified revision(s) (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand simplify-parents" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand simplify-parents" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand simplify-parents" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand simplify-parents" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand simplify-parents" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand simplify-parents" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand simplify-parents" -l no-integrate-operation -d 'Run the command as usual but don\'t integrate any operations'
complete -c jj -n "__fish_jj_using_subcommand simplify-parents" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand simplify-parents" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand simplify-parents" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand simplify-parents" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand simplify-parents" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand sparse; and not __fish_seen_subcommand_from edit list reset set" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand sparse; and not __fish_seen_subcommand_from edit list reset set" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand sparse; and not __fish_seen_subcommand_from edit list reset set" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand sparse; and not __fish_seen_subcommand_from edit list reset set" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand sparse; and not __fish_seen_subcommand_from edit list reset set" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand sparse; and not __fish_seen_subcommand_from edit list reset set" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand sparse; and not __fish_seen_subcommand_from edit list reset set" -l no-integrate-operation -d 'Run the command as usual but don\'t integrate any operations'
complete -c jj -n "__fish_jj_using_subcommand sparse; and not __fish_seen_subcommand_from edit list reset set" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand sparse; and not __fish_seen_subcommand_from edit list reset set" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand sparse; and not __fish_seen_subcommand_from edit list reset set" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand sparse; and not __fish_seen_subcommand_from edit list reset set" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand sparse; and not __fish_seen_subcommand_from edit list reset set" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand sparse; and not __fish_seen_subcommand_from edit list reset set" -f -a "edit" -d 'Start an editor to update the patterns that are present in the working copy'
complete -c jj -n "__fish_jj_using_subcommand sparse; and not __fish_seen_subcommand_from edit list reset set" -f -a "list" -d 'List the patterns that are currently present in the working copy'
complete -c jj -n "__fish_jj_using_subcommand sparse; and not __fish_seen_subcommand_from edit list reset set" -f -a "reset" -d 'Reset the patterns to include all files in the working copy'
complete -c jj -n "__fish_jj_using_subcommand sparse; and not __fish_seen_subcommand_from edit list reset set" -f -a "set" -d 'Update the patterns that are present in the working copy'
complete -c jj -n "__fish_jj_using_subcommand sparse; and __fish_seen_subcommand_from edit" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand sparse; and __fish_seen_subcommand_from edit" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand sparse; and __fish_seen_subcommand_from edit" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand sparse; and __fish_seen_subcommand_from edit" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand sparse; and __fish_seen_subcommand_from edit" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand sparse; and __fish_seen_subcommand_from edit" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand sparse; and __fish_seen_subcommand_from edit" -l no-integrate-operation -d 'Run the command as usual but don\'t integrate any operations'
complete -c jj -n "__fish_jj_using_subcommand sparse; and __fish_seen_subcommand_from edit" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand sparse; and __fish_seen_subcommand_from edit" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand sparse; and __fish_seen_subcommand_from edit" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand sparse; and __fish_seen_subcommand_from edit" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand sparse; and __fish_seen_subcommand_from edit" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand sparse; and __fish_seen_subcommand_from list" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand sparse; and __fish_seen_subcommand_from list" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand sparse; and __fish_seen_subcommand_from list" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand sparse; and __fish_seen_subcommand_from list" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand sparse; and __fish_seen_subcommand_from list" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand sparse; and __fish_seen_subcommand_from list" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand sparse; and __fish_seen_subcommand_from list" -l no-integrate-operation -d 'Run the command as usual but don\'t integrate any operations'
complete -c jj -n "__fish_jj_using_subcommand sparse; and __fish_seen_subcommand_from list" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand sparse; and __fish_seen_subcommand_from list" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand sparse; and __fish_seen_subcommand_from list" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand sparse; and __fish_seen_subcommand_from list" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand sparse; and __fish_seen_subcommand_from list" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand sparse; and __fish_seen_subcommand_from reset" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand sparse; and __fish_seen_subcommand_from reset" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand sparse; and __fish_seen_subcommand_from reset" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand sparse; and __fish_seen_subcommand_from reset" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand sparse; and __fish_seen_subcommand_from reset" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand sparse; and __fish_seen_subcommand_from reset" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand sparse; and __fish_seen_subcommand_from reset" -l no-integrate-operation -d 'Run the command as usual but don\'t integrate any operations'
complete -c jj -n "__fish_jj_using_subcommand sparse; and __fish_seen_subcommand_from reset" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand sparse; and __fish_seen_subcommand_from reset" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand sparse; and __fish_seen_subcommand_from reset" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand sparse; and __fish_seen_subcommand_from reset" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand sparse; and __fish_seen_subcommand_from reset" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand sparse; and __fish_seen_subcommand_from set" -l add -d 'Patterns to add to the working copy' -r -F
complete -c jj -n "__fish_jj_using_subcommand sparse; and __fish_seen_subcommand_from set" -l remove -d 'Patterns to remove from the working copy' -r -F
complete -c jj -n "__fish_jj_using_subcommand sparse; and __fish_seen_subcommand_from set" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand sparse; and __fish_seen_subcommand_from set" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand sparse; and __fish_seen_subcommand_from set" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand sparse; and __fish_seen_subcommand_from set" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand sparse; and __fish_seen_subcommand_from set" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand sparse; and __fish_seen_subcommand_from set" -l clear -d 'Include no files in the working copy (combine with --add)'
complete -c jj -n "__fish_jj_using_subcommand sparse; and __fish_seen_subcommand_from set" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand sparse; and __fish_seen_subcommand_from set" -l no-integrate-operation -d 'Run the command as usual but don\'t integrate any operations'
complete -c jj -n "__fish_jj_using_subcommand sparse; and __fish_seen_subcommand_from set" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand sparse; and __fish_seen_subcommand_from set" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand sparse; and __fish_seen_subcommand_from set" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand sparse; and __fish_seen_subcommand_from set" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand sparse; and __fish_seen_subcommand_from set" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand split" -l tool -d 'Specify diff editor to be used (implies --interactive)' -r
complete -c jj -n "__fish_jj_using_subcommand split" -s r -l revision -d 'The revision to split' -r
complete -c jj -n "__fish_jj_using_subcommand split" -s o -s d -l onto -l destination -d 'The revision(s) to rebase the selected changes onto (can be repeated to create a merge commit)' -r
complete -c jj -n "__fish_jj_using_subcommand split" -s A -l insert-after -l after -d 'The revision(s) to insert after (can be repeated to create a merge commit)' -r
complete -c jj -n "__fish_jj_using_subcommand split" -s B -l insert-before -l before -d 'The revision(s) to insert before (can be repeated to create a merge commit)' -r
complete -c jj -n "__fish_jj_using_subcommand split" -s m -l message -d 'The change description to use for the selected changes (don\'t open editor)' -r
complete -c jj -n "__fish_jj_using_subcommand split" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand split" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand split" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand split" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand split" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand split" -s i -l interactive -d 'Interactively choose which parts to split'
complete -c jj -n "__fish_jj_using_subcommand split" -l editor -d 'Open an editor to edit the change description(s)'
complete -c jj -n "__fish_jj_using_subcommand split" -s p -l parallel -d 'Split the revision into two parallel revisions instead of a parent and child'
complete -c jj -n "__fish_jj_using_subcommand split" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand split" -l no-integrate-operation -d 'Run the command as usual but don\'t integrate any operations'
complete -c jj -n "__fish_jj_using_subcommand split" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand split" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand split" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand split" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand split" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand squash" -s r -l revision -d 'Revision to squash into its parent (default: @). Incompatible with the experimental `-o`/`-A`/`-B` options' -r
complete -c jj -n "__fish_jj_using_subcommand squash" -s f -l from -d 'Revision(s) to squash from (default: @)' -r
complete -c jj -n "__fish_jj_using_subcommand squash" -s t -l into -l to -d 'Revision to squash into (default: @)' -r
complete -c jj -n "__fish_jj_using_subcommand squash" -s o -s d -l onto -l destination -d '(Experimental) The revision(s) to use as parent for the new commit (can be repeated to create a merge commit)' -r
complete -c jj -n "__fish_jj_using_subcommand squash" -s A -l insert-after -l after -d '(Experimental) The revision(s) to insert the new commit after (can be repeated to create a merge commit)' -r
complete -c jj -n "__fish_jj_using_subcommand squash" -s B -l insert-before -l before -d '(Experimental) The revision(s) to insert the new commit before (can be repeated to create a merge commit)' -r
complete -c jj -n "__fish_jj_using_subcommand squash" -s m -l message -d 'The description to use for squashed revision (don\'t open editor)' -r
complete -c jj -n "__fish_jj_using_subcommand squash" -l tool -d 'Specify diff editor to be used (implies --interactive)' -r
complete -c jj -n "__fish_jj_using_subcommand squash" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand squash" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand squash" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand squash" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand squash" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand squash" -s u -l use-destination-message -d 'Use the description of the destination revision and discard the description(s) of the source revision(s)'
complete -c jj -n "__fish_jj_using_subcommand squash" -l editor -d 'Open an editor to edit the change description'
complete -c jj -n "__fish_jj_using_subcommand squash" -s i -l interactive -d 'Interactively choose which parts to squash'
complete -c jj -n "__fish_jj_using_subcommand squash" -s k -l keep-emptied -d 'The source revision will not be abandoned'
complete -c jj -n "__fish_jj_using_subcommand squash" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand squash" -l no-integrate-operation -d 'Run the command as usual but don\'t integrate any operations'
complete -c jj -n "__fish_jj_using_subcommand squash" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand squash" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand squash" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand squash" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand squash" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand status" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand status" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand status" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand status" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand status" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand status" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand status" -l no-integrate-operation -d 'Run the command as usual but don\'t integrate any operations'
complete -c jj -n "__fish_jj_using_subcommand status" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand status" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand status" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand status" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand status" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand tag; and not __fish_seen_subcommand_from delete d list l set s track untrack" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand tag; and not __fish_seen_subcommand_from delete d list l set s track untrack" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand tag; and not __fish_seen_subcommand_from delete d list l set s track untrack" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand tag; and not __fish_seen_subcommand_from delete d list l set s track untrack" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand tag; and not __fish_seen_subcommand_from delete d list l set s track untrack" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand tag; and not __fish_seen_subcommand_from delete d list l set s track untrack" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand tag; and not __fish_seen_subcommand_from delete d list l set s track untrack" -l no-integrate-operation -d 'Run the command as usual but don\'t integrate any operations'
complete -c jj -n "__fish_jj_using_subcommand tag; and not __fish_seen_subcommand_from delete d list l set s track untrack" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand tag; and not __fish_seen_subcommand_from delete d list l set s track untrack" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand tag; and not __fish_seen_subcommand_from delete d list l set s track untrack" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand tag; and not __fish_seen_subcommand_from delete d list l set s track untrack" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand tag; and not __fish_seen_subcommand_from delete d list l set s track untrack" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand tag; and not __fish_seen_subcommand_from delete d list l set s track untrack" -f -a "delete" -d 'Delete existing tags'
complete -c jj -n "__fish_jj_using_subcommand tag; and not __fish_seen_subcommand_from delete d list l set s track untrack" -f -a "d" -d 'Delete existing tags'
complete -c jj -n "__fish_jj_using_subcommand tag; and not __fish_seen_subcommand_from delete d list l set s track untrack" -f -a "list" -d 'List tags and their targets'
complete -c jj -n "__fish_jj_using_subcommand tag; and not __fish_seen_subcommand_from delete d list l set s track untrack" -f -a "l" -d 'List tags and their targets'
complete -c jj -n "__fish_jj_using_subcommand tag; and not __fish_seen_subcommand_from delete d list l set s track untrack" -f -a "set" -d 'Create or update tags'
complete -c jj -n "__fish_jj_using_subcommand tag; and not __fish_seen_subcommand_from delete d list l set s track untrack" -f -a "s" -d 'Create or update tags'
complete -c jj -n "__fish_jj_using_subcommand tag; and not __fish_seen_subcommand_from delete d list l set s track untrack" -f -a "track" -d 'Start tracking given remote tags'
complete -c jj -n "__fish_jj_using_subcommand tag; and not __fish_seen_subcommand_from delete d list l set s track untrack" -f -a "untrack" -d 'Stop tracking given remote tags'
complete -c jj -n "__fish_jj_using_subcommand tag; and __fish_seen_subcommand_from delete" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand tag; and __fish_seen_subcommand_from delete" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand tag; and __fish_seen_subcommand_from delete" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand tag; and __fish_seen_subcommand_from delete" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand tag; and __fish_seen_subcommand_from delete" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand tag; and __fish_seen_subcommand_from delete" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand tag; and __fish_seen_subcommand_from delete" -l no-integrate-operation -d 'Run the command as usual but don\'t integrate any operations'
complete -c jj -n "__fish_jj_using_subcommand tag; and __fish_seen_subcommand_from delete" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand tag; and __fish_seen_subcommand_from delete" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand tag; and __fish_seen_subcommand_from delete" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand tag; and __fish_seen_subcommand_from delete" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand tag; and __fish_seen_subcommand_from delete" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand tag; and __fish_seen_subcommand_from d" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand tag; and __fish_seen_subcommand_from d" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand tag; and __fish_seen_subcommand_from d" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand tag; and __fish_seen_subcommand_from d" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand tag; and __fish_seen_subcommand_from d" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand tag; and __fish_seen_subcommand_from d" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand tag; and __fish_seen_subcommand_from d" -l no-integrate-operation -d 'Run the command as usual but don\'t integrate any operations'
complete -c jj -n "__fish_jj_using_subcommand tag; and __fish_seen_subcommand_from d" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand tag; and __fish_seen_subcommand_from d" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand tag; and __fish_seen_subcommand_from d" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand tag; and __fish_seen_subcommand_from d" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand tag; and __fish_seen_subcommand_from d" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand tag; and __fish_seen_subcommand_from list" -l remote -d 'Show all tracked and untracked remote tags belonging to this remote' -r
complete -c jj -n "__fish_jj_using_subcommand tag; and __fish_seen_subcommand_from list" -s r -l revision -d 'Show tags whose local targets are in the given revisions' -r
complete -c jj -n "__fish_jj_using_subcommand tag; and __fish_seen_subcommand_from list" -s T -l template -d 'Render each tag using the given template' -r
complete -c jj -n "__fish_jj_using_subcommand tag; and __fish_seen_subcommand_from list" -l sort -d 'Sort tags based on the given key (or multiple keys)' -r -f -a "name\t''
name-\t''
author-name\t''
author-name-\t''
author-email\t''
author-email-\t''
author-date\t''
author-date-\t''
committer-name\t''
committer-name-\t''
committer-email\t''
committer-email-\t''
committer-date\t''
committer-date-\t''"
complete -c jj -n "__fish_jj_using_subcommand tag; and __fish_seen_subcommand_from list" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand tag; and __fish_seen_subcommand_from list" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand tag; and __fish_seen_subcommand_from list" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand tag; and __fish_seen_subcommand_from list" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand tag; and __fish_seen_subcommand_from list" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand tag; and __fish_seen_subcommand_from list" -s a -l all-remotes -d 'Show all tracked and untracked remote tags including the ones whose targets are synchronized with the local tags'
complete -c jj -n "__fish_jj_using_subcommand tag; and __fish_seen_subcommand_from list" -s t -l tracked -d 'Show tracked remote tags only'
complete -c jj -n "__fish_jj_using_subcommand tag; and __fish_seen_subcommand_from list" -s c -l conflicted -d 'Show conflicted tags only'
complete -c jj -n "__fish_jj_using_subcommand tag; and __fish_seen_subcommand_from list" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand tag; and __fish_seen_subcommand_from list" -l no-integrate-operation -d 'Run the command as usual but don\'t integrate any operations'
complete -c jj -n "__fish_jj_using_subcommand tag; and __fish_seen_subcommand_from list" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand tag; and __fish_seen_subcommand_from list" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand tag; and __fish_seen_subcommand_from list" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand tag; and __fish_seen_subcommand_from list" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand tag; and __fish_seen_subcommand_from list" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand tag; and __fish_seen_subcommand_from l" -l remote -d 'Show all tracked and untracked remote tags belonging to this remote' -r
complete -c jj -n "__fish_jj_using_subcommand tag; and __fish_seen_subcommand_from l" -s r -l revision -d 'Show tags whose local targets are in the given revisions' -r
complete -c jj -n "__fish_jj_using_subcommand tag; and __fish_seen_subcommand_from l" -s T -l template -d 'Render each tag using the given template' -r
complete -c jj -n "__fish_jj_using_subcommand tag; and __fish_seen_subcommand_from l" -l sort -d 'Sort tags based on the given key (or multiple keys)' -r -f -a "name\t''
name-\t''
author-name\t''
author-name-\t''
author-email\t''
author-email-\t''
author-date\t''
author-date-\t''
committer-name\t''
committer-name-\t''
committer-email\t''
committer-email-\t''
committer-date\t''
committer-date-\t''"
complete -c jj -n "__fish_jj_using_subcommand tag; and __fish_seen_subcommand_from l" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand tag; and __fish_seen_subcommand_from l" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand tag; and __fish_seen_subcommand_from l" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand tag; and __fish_seen_subcommand_from l" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand tag; and __fish_seen_subcommand_from l" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand tag; and __fish_seen_subcommand_from l" -s a -l all-remotes -d 'Show all tracked and untracked remote tags including the ones whose targets are synchronized with the local tags'
complete -c jj -n "__fish_jj_using_subcommand tag; and __fish_seen_subcommand_from l" -s t -l tracked -d 'Show tracked remote tags only'
complete -c jj -n "__fish_jj_using_subcommand tag; and __fish_seen_subcommand_from l" -s c -l conflicted -d 'Show conflicted tags only'
complete -c jj -n "__fish_jj_using_subcommand tag; and __fish_seen_subcommand_from l" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand tag; and __fish_seen_subcommand_from l" -l no-integrate-operation -d 'Run the command as usual but don\'t integrate any operations'
complete -c jj -n "__fish_jj_using_subcommand tag; and __fish_seen_subcommand_from l" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand tag; and __fish_seen_subcommand_from l" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand tag; and __fish_seen_subcommand_from l" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand tag; and __fish_seen_subcommand_from l" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand tag; and __fish_seen_subcommand_from l" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand tag; and __fish_seen_subcommand_from set" -s r -l revision -l to -d 'Target revision to point to' -r
complete -c jj -n "__fish_jj_using_subcommand tag; and __fish_seen_subcommand_from set" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand tag; and __fish_seen_subcommand_from set" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand tag; and __fish_seen_subcommand_from set" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand tag; and __fish_seen_subcommand_from set" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand tag; and __fish_seen_subcommand_from set" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand tag; and __fish_seen_subcommand_from set" -l allow-move -d 'Allow moving existing tags'
complete -c jj -n "__fish_jj_using_subcommand tag; and __fish_seen_subcommand_from set" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand tag; and __fish_seen_subcommand_from set" -l no-integrate-operation -d 'Run the command as usual but don\'t integrate any operations'
complete -c jj -n "__fish_jj_using_subcommand tag; and __fish_seen_subcommand_from set" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand tag; and __fish_seen_subcommand_from set" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand tag; and __fish_seen_subcommand_from set" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand tag; and __fish_seen_subcommand_from set" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand tag; and __fish_seen_subcommand_from set" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand tag; and __fish_seen_subcommand_from s" -s r -l revision -l to -d 'Target revision to point to' -r
complete -c jj -n "__fish_jj_using_subcommand tag; and __fish_seen_subcommand_from s" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand tag; and __fish_seen_subcommand_from s" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand tag; and __fish_seen_subcommand_from s" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand tag; and __fish_seen_subcommand_from s" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand tag; and __fish_seen_subcommand_from s" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand tag; and __fish_seen_subcommand_from s" -l allow-move -d 'Allow moving existing tags'
complete -c jj -n "__fish_jj_using_subcommand tag; and __fish_seen_subcommand_from s" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand tag; and __fish_seen_subcommand_from s" -l no-integrate-operation -d 'Run the command as usual but don\'t integrate any operations'
complete -c jj -n "__fish_jj_using_subcommand tag; and __fish_seen_subcommand_from s" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand tag; and __fish_seen_subcommand_from s" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand tag; and __fish_seen_subcommand_from s" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand tag; and __fish_seen_subcommand_from s" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand tag; and __fish_seen_subcommand_from s" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand tag; and __fish_seen_subcommand_from track" -l remote -d 'Remote names to track' -r
complete -c jj -n "__fish_jj_using_subcommand tag; and __fish_seen_subcommand_from track" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand tag; and __fish_seen_subcommand_from track" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand tag; and __fish_seen_subcommand_from track" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand tag; and __fish_seen_subcommand_from track" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand tag; and __fish_seen_subcommand_from track" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand tag; and __fish_seen_subcommand_from track" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand tag; and __fish_seen_subcommand_from track" -l no-integrate-operation -d 'Run the command as usual but don\'t integrate any operations'
complete -c jj -n "__fish_jj_using_subcommand tag; and __fish_seen_subcommand_from track" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand tag; and __fish_seen_subcommand_from track" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand tag; and __fish_seen_subcommand_from track" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand tag; and __fish_seen_subcommand_from track" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand tag; and __fish_seen_subcommand_from track" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand tag; and __fish_seen_subcommand_from untrack" -l remote -d 'Remote names to untrack' -r
complete -c jj -n "__fish_jj_using_subcommand tag; and __fish_seen_subcommand_from untrack" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand tag; and __fish_seen_subcommand_from untrack" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand tag; and __fish_seen_subcommand_from untrack" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand tag; and __fish_seen_subcommand_from untrack" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand tag; and __fish_seen_subcommand_from untrack" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand tag; and __fish_seen_subcommand_from untrack" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand tag; and __fish_seen_subcommand_from untrack" -l no-integrate-operation -d 'Run the command as usual but don\'t integrate any operations'
complete -c jj -n "__fish_jj_using_subcommand tag; and __fish_seen_subcommand_from untrack" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand tag; and __fish_seen_subcommand_from untrack" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand tag; and __fish_seen_subcommand_from untrack" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand tag; and __fish_seen_subcommand_from untrack" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand tag; and __fish_seen_subcommand_from untrack" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand undo" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand undo" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand undo" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand undo" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand undo" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand undo" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand undo" -l no-integrate-operation -d 'Run the command as usual but don\'t integrate any operations'
complete -c jj -n "__fish_jj_using_subcommand undo" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand undo" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand undo" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand undo" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand undo" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand unsign" -s r -l revision -d 'What revision(s) to unsign' -r
complete -c jj -n "__fish_jj_using_subcommand unsign" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand unsign" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand unsign" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand unsign" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand unsign" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand unsign" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand unsign" -l no-integrate-operation -d 'Run the command as usual but don\'t integrate any operations'
complete -c jj -n "__fish_jj_using_subcommand unsign" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand unsign" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand unsign" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand unsign" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand unsign" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand util; and not __fish_seen_subcommand_from backend completion config-schema exec gc install-man-pages markdown-help snapshot" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand util; and not __fish_seen_subcommand_from backend completion config-schema exec gc install-man-pages markdown-help snapshot" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand util; and not __fish_seen_subcommand_from backend completion config-schema exec gc install-man-pages markdown-help snapshot" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand util; and not __fish_seen_subcommand_from backend completion config-schema exec gc install-man-pages markdown-help snapshot" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand util; and not __fish_seen_subcommand_from backend completion config-schema exec gc install-man-pages markdown-help snapshot" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand util; and not __fish_seen_subcommand_from backend completion config-schema exec gc install-man-pages markdown-help snapshot" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand util; and not __fish_seen_subcommand_from backend completion config-schema exec gc install-man-pages markdown-help snapshot" -l no-integrate-operation -d 'Run the command as usual but don\'t integrate any operations'
complete -c jj -n "__fish_jj_using_subcommand util; and not __fish_seen_subcommand_from backend completion config-schema exec gc install-man-pages markdown-help snapshot" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand util; and not __fish_seen_subcommand_from backend completion config-schema exec gc install-man-pages markdown-help snapshot" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand util; and not __fish_seen_subcommand_from backend completion config-schema exec gc install-man-pages markdown-help snapshot" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand util; and not __fish_seen_subcommand_from backend completion config-schema exec gc install-man-pages markdown-help snapshot" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand util; and not __fish_seen_subcommand_from backend completion config-schema exec gc install-man-pages markdown-help snapshot" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand util; and not __fish_seen_subcommand_from backend completion config-schema exec gc install-man-pages markdown-help snapshot" -f -a "backend" -d 'Commands relating to the backend used in the current repo'
complete -c jj -n "__fish_jj_using_subcommand util; and not __fish_seen_subcommand_from backend completion config-schema exec gc install-man-pages markdown-help snapshot" -f -a "completion" -d 'Print a command-line-completion script'
complete -c jj -n "__fish_jj_using_subcommand util; and not __fish_seen_subcommand_from backend completion config-schema exec gc install-man-pages markdown-help snapshot" -f -a "config-schema" -d 'Print the JSON schema for the jj TOML config format'
complete -c jj -n "__fish_jj_using_subcommand util; and not __fish_seen_subcommand_from backend completion config-schema exec gc install-man-pages markdown-help snapshot" -f -a "exec" -d 'Execute an external command via jj'
complete -c jj -n "__fish_jj_using_subcommand util; and not __fish_seen_subcommand_from backend completion config-schema exec gc install-man-pages markdown-help snapshot" -f -a "gc" -d 'Run backend-dependent garbage collection'
complete -c jj -n "__fish_jj_using_subcommand util; and not __fish_seen_subcommand_from backend completion config-schema exec gc install-man-pages markdown-help snapshot" -f -a "install-man-pages" -d 'Install Jujutsu\'s manpages to the provided path'
complete -c jj -n "__fish_jj_using_subcommand util; and not __fish_seen_subcommand_from backend completion config-schema exec gc install-man-pages markdown-help snapshot" -f -a "markdown-help" -d 'Print the CLI help for all subcommands in Markdown'
complete -c jj -n "__fish_jj_using_subcommand util; and not __fish_seen_subcommand_from backend completion config-schema exec gc install-man-pages markdown-help snapshot" -f -a "snapshot" -d 'Snapshot the working copy if needed'
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from backend" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from backend" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from backend" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from backend" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from backend" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from backend" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from backend" -l no-integrate-operation -d 'Run the command as usual but don\'t integrate any operations'
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from backend" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from backend" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from backend" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from backend" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from backend" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from backend" -f -a "name" -d 'Print the name of the backend used in the current repo'
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from completion" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from completion" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from completion" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from completion" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from completion" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from completion" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from completion" -l no-integrate-operation -d 'Run the command as usual but don\'t integrate any operations'
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from completion" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from completion" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from completion" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from completion" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from completion" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from config-schema" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from config-schema" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from config-schema" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from config-schema" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from config-schema" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from config-schema" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from config-schema" -l no-integrate-operation -d 'Run the command as usual but don\'t integrate any operations'
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from config-schema" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from config-schema" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from config-schema" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from config-schema" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from config-schema" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from exec" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from exec" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from exec" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from exec" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from exec" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from exec" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from exec" -l no-integrate-operation -d 'Run the command as usual but don\'t integrate any operations'
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from exec" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from exec" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from exec" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from exec" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from exec" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from gc" -l expire -d 'Time threshold' -r
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from gc" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from gc" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from gc" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from gc" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from gc" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from gc" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from gc" -l no-integrate-operation -d 'Run the command as usual but don\'t integrate any operations'
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from gc" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from gc" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from gc" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from gc" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from gc" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from install-man-pages" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from install-man-pages" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from install-man-pages" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from install-man-pages" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from install-man-pages" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from install-man-pages" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from install-man-pages" -l no-integrate-operation -d 'Run the command as usual but don\'t integrate any operations'
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from install-man-pages" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from install-man-pages" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from install-man-pages" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from install-man-pages" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from install-man-pages" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from markdown-help" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from markdown-help" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from markdown-help" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from markdown-help" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from markdown-help" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from markdown-help" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from markdown-help" -l no-integrate-operation -d 'Run the command as usual but don\'t integrate any operations'
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from markdown-help" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from markdown-help" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from markdown-help" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from markdown-help" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from markdown-help" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from snapshot" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from snapshot" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from snapshot" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from snapshot" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from snapshot" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from snapshot" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from snapshot" -l no-integrate-operation -d 'Run the command as usual but don\'t integrate any operations'
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from snapshot" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from snapshot" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from snapshot" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from snapshot" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from snapshot" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand version" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand version" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand version" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand version" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand version" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand version" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand version" -l no-integrate-operation -d 'Run the command as usual but don\'t integrate any operations'
complete -c jj -n "__fish_jj_using_subcommand version" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand version" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand version" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand version" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand version" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand workspace; and not __fish_seen_subcommand_from add forget list rename root update-stale" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand workspace; and not __fish_seen_subcommand_from add forget list rename root update-stale" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand workspace; and not __fish_seen_subcommand_from add forget list rename root update-stale" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand workspace; and not __fish_seen_subcommand_from add forget list rename root update-stale" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand workspace; and not __fish_seen_subcommand_from add forget list rename root update-stale" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand workspace; and not __fish_seen_subcommand_from add forget list rename root update-stale" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand workspace; and not __fish_seen_subcommand_from add forget list rename root update-stale" -l no-integrate-operation -d 'Run the command as usual but don\'t integrate any operations'
complete -c jj -n "__fish_jj_using_subcommand workspace; and not __fish_seen_subcommand_from add forget list rename root update-stale" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand workspace; and not __fish_seen_subcommand_from add forget list rename root update-stale" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand workspace; and not __fish_seen_subcommand_from add forget list rename root update-stale" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand workspace; and not __fish_seen_subcommand_from add forget list rename root update-stale" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand workspace; and not __fish_seen_subcommand_from add forget list rename root update-stale" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand workspace; and not __fish_seen_subcommand_from add forget list rename root update-stale" -f -a "add" -d 'Add a workspace'
complete -c jj -n "__fish_jj_using_subcommand workspace; and not __fish_seen_subcommand_from add forget list rename root update-stale" -f -a "forget" -d 'Stop tracking a workspace\'s working-copy commit in the repo'
complete -c jj -n "__fish_jj_using_subcommand workspace; and not __fish_seen_subcommand_from add forget list rename root update-stale" -f -a "list" -d 'List workspaces'
complete -c jj -n "__fish_jj_using_subcommand workspace; and not __fish_seen_subcommand_from add forget list rename root update-stale" -f -a "rename" -d 'Renames the current workspace'
complete -c jj -n "__fish_jj_using_subcommand workspace; and not __fish_seen_subcommand_from add forget list rename root update-stale" -f -a "root" -d 'Show the workspace root directory'
complete -c jj -n "__fish_jj_using_subcommand workspace; and not __fish_seen_subcommand_from add forget list rename root update-stale" -f -a "update-stale" -d 'Update a workspace that has become stale'
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from add" -l name -d 'A name for the workspace' -r
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from add" -s r -l revision -d 'A list of parent revisions for the working-copy commit of the newly created workspace. You may specify nothing, or any number of parents' -r
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from add" -s m -l message -d 'The change description to use' -r
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from add" -l sparse-patterns -d 'How to handle sparse patterns when creating a new workspace' -r -f -a "copy\t'Copy all sparse patterns from the current workspace'
full\t'Include all files in the new workspace'
empty\t'Clear all files from the workspace (it will be empty)'"
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from add" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from add" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from add" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from add" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from add" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from add" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from add" -l no-integrate-operation -d 'Run the command as usual but don\'t integrate any operations'
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from add" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from add" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from add" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from add" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from add" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from forget" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from forget" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from forget" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from forget" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from forget" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from forget" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from forget" -l no-integrate-operation -d 'Run the command as usual but don\'t integrate any operations'
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from forget" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from forget" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from forget" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from forget" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from forget" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from list" -s T -l template -d 'Render each workspace using the given template' -r
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from list" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from list" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from list" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from list" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from list" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from list" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from list" -l no-integrate-operation -d 'Run the command as usual but don\'t integrate any operations'
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from list" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from list" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from list" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from list" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from list" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from rename" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from rename" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from rename" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from rename" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from rename" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from rename" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from rename" -l no-integrate-operation -d 'Run the command as usual but don\'t integrate any operations'
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from rename" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from rename" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from rename" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from rename" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from rename" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from root" -l name -d 'Name of the workspace (defaults to current)' -r
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from root" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from root" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from root" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from root" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from root" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from root" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from root" -l no-integrate-operation -d 'Run the command as usual but don\'t integrate any operations'
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from root" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from root" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from root" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from root" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from root" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from update-stale" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from update-stale" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from update-stale" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from update-stale" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from update-stale" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from update-stale" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from update-stale" -l no-integrate-operation -d 'Run the command as usual but don\'t integrate any operations'
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from update-stale" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from update-stale" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from update-stale" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from update-stale" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from update-stale" -s h -l help -d 'Print help (see more with \'--help\')'
