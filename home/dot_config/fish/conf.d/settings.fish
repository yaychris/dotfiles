# Settings that used to live in fish_variables (fish's machine-local
# universal-variable store, which is not tracked). Declared here as globals
# so they're the same on every machine.

set -g fish_key_bindings fish_hybrid_key_bindings
fish_add_path -g ~/.fzf/bin

# Colors (Tomorrow Night)
set -g fish_color_autosuggestion 969896
set -g fish_color_cancel -r
set -g fish_color_command c397d8
set -g fish_color_comment e7c547
set -g fish_color_cwd green
set -g fish_color_cwd_root red
set -g fish_color_end c397d8
set -g fish_color_error d54e53
set -g fish_color_escape 00a6b2
set -g fish_color_history_current --bold
set -g fish_color_host normal
set -g fish_color_host_remote yellow
set -g fish_color_match --background=brblue
set -g fish_color_normal normal
set -g fish_color_operator 00a6b2
set -g fish_color_param 7aa6da
set -g fish_color_quote b9ca4a
set -g fish_color_redirection 70c0b1
set -g fish_color_search_match white --background=brblack
set -g fish_color_selection white --bold --background=brblack
set -g fish_color_status red
set -g fish_color_user brgreen
set -g fish_color_valid_path --underline
set -g fish_pager_color_completion normal
set -g fish_pager_color_description B3A06D yellow
set -g fish_pager_color_prefix white --bold --underline
set -g fish_pager_color_progress brwhite --background=cyan
set -g fish_pager_color_selected_background -r
