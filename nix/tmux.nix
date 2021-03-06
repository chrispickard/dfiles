{ config, pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    baseIndex = 1;
    escapeTime = 0;
    historyLimit = 10000;
    keyMode = "vi";
    sensibleOnTop = true;
    customPaneNavigationAndResize = true;
    prefix = "M-a";
    terminal = "$TERM";
    secureSocket = true;
    tmuxp.enable = true;
    plugins = with pkgs; [
      tmuxPlugins.extrakto
      tmuxPlugins.nord
      tmuxPlugins.prefix-highlight
      tmuxPlugins.yank
      # tmuxPlugins.better-mouse-mode
    ];
    extraConfig = ''
      set -g terminal-overrides ',xterm-256color:Tc'
      bind -n M-h select-pane -L
      bind -n M-j select-pane -D
      bind -n M-k select-pane -U
      bind -n M-l select-pane -R

      bind -n M-m select-pane -t :.+
      bind -n M-n next-window
      set-option -g allow-rename off

      # # Set colors
      # set -g status-left-length 52
      # set -g status-right-length 20
      # set -g status-fg white
      # set -g status-bg colour234
      # set -g status-left '#[fg=colour235,bg=colour252,bold] #S #[fg=colour252,bg=colour238,nobold]#[fg=colour245,bg=colour238,bold] #(whoami)#[fg=colour238,bg=colour234,nobold]'
      # # set -g status-right \\'\\'

      # set -g window-status-current-style 'fg=cyan'
      set -g mode-style 'bg=colour6,fg=colour0'
      set -g message-style 'fg=colour6'
      set -g pane-border-style 'fg=colour0'
      set -g pane-active-border-style 'fg=colour8'

      bind '"' split-window -c "#{pane_current_path}"
      bind % split-window -h -c "#{pane_current_path}"
      bind c new-window -c "#{pane_current_path}"

      bind -n WheelUpPane copy-mode
      set-option -g mouse on

      # set -g @emulate-scroll-for-no-mouse-alternate-buffer "on"
      # run-shell ~/tmux-better-mouse-mode/scroll_copy_mode.tmux
    '';
    #     set -g @plugin 'tmux-plugins/tpm'
    #     set -g @plugin "arcticicestudio/nord-tmux"
    #     set -g @plugin 'nhdaly/tmux-better-mouse-mode'
    #     # set -g @plugin 'tmux-plugins/tmux-yank'
    #     set -g @plugin 'tmux-plugins/tmux-sensible'
    #     # set -g @plugin 'tmux-plugins/tmux-copycat'
    #     # set -g @plugin 'Morantron/tmux-fingers'
    #     set -g @plugin 'tmux-plugins/tmux-open'
    #     set -g @plugin 'tmux-plugins/tmux-prefix-highlight'
    #     set -g @plugin 'jbnicolai/tmux-fpp'
  };
  home.file.".tmuxp/work.yaml".text = ''
    session_name: work
    windows:
      - window_name: ""
        panes:
          - focus: true
          - null
      '';
  #   home.file.".tmux.conf".text = ''
  #     set -g prefix M-a
  #     unbind C-b
  #     bind M-a send-prefix

  #     # force a reload of the config file
  #     unbind r
  #     bind r source-file ~/.tmux.conf

  #     # set-option -g default-command "reattach-to-user-namespace -l zsh"

  #     # # quick pane cycling
  #     # unbind ^A
  #     # bind ^A select-pane -t :.+

  #     # mouse options
  #     # setw -g mouse-select-pane on
  #     # set -g mouse-resize-pane on
  #     # set -g mouse-select-window on
  #     bind -n WheelUpPane copy-mode
  #     set-option -g mouse on
  #     # set-option -g mouse-select-pane on

  #     set -g base-index 1
  #     set -g pane-base-index 1
  #     set -g default-terminal "$TERM"
  #     set -g terminal-overrides ',xterm-256color:Tc'
  #     # improve colors
  #     # set -g default-terminal "xterm-kitty"
  #     #set-option  -ga terminal-overrides  ",xterm-kitty:Tc"
  #     # set -g default-terminal "xterm-256color"
  #     # set -g terminal-overrides ',xterm-256color:Tc'

  #     set-option -g allow-rename off

  #     # Set colors
  #     set -g status-left-length 52
  #     set -g status-right-length 20
  #     set -g status-fg white
  #     set -g status-bg colour234
  #     # set -g window-status-activity-attr bold
  #     # set -g pane-border-fg colour245
  #     # set -g pane-active-border-fg colour39
  #     # set -g message-fg colour16
  #     # set -g message-bg colour221
  #     # set -g message-attr bold
  #     set -g status-left '#[fg=colour235,bg=colour252,bold] #S #[fg=colour252,bg=colour238,nobold]#[fg=colour245,bg=colour238,bold] #(whoami)#[fg=colour238,bg=colour234,nobold]'
  #     set -g status-right \'\'
  #     setw -g mode-keys vi

  #     bind h select-pane -L
  #     bind j select-pane -D
  #     bind k select-pane -U
  #     bind l select-pane -R

  #     bind -n M-h select-pane -L
  #     bind -n M-j select-pane -D
  #     bind -n M-k select-pane -U
  #     bind -n M-l select-pane -R

  #     bind -n M-m select-pane -t :.+
  #     bind -n M-n next-window

  #     bind -n M-p previous-window

  #     # bind-key -t vi-copy MouseDragEnd1Pane copy-pipe "xclip -sel clip"
  #     # bind y run-shell "tmux show-buffer | xclip -sel clip -i" \; display-message "Copied tmux buffer to system clipboard"

  #     # set-option -s set-clipboard on
  #     # bind-key -T copy-mode-vi MouseDragEnd1Pane send-keys -X copy-pipe-and-cancel "xclip -se c -i"
  #     # set -g set-clipboard on

  #     bind-key -r C-h select-window -t :-
  #     bind-key -r C-l select-window -t :+

  #     set -sg escape-time 0

  #     # Pretend our terminal doesn't support alternative screens, and thus all text
  #     # should be placed into the scrollback buffer when it goes off the top of the
  #     # screen.
  #     # http://superuser.com/questions/310251/use-terminal-scrollbar-with-tmux
  #     # set-option -ga terminal-overrides ',xterm*:smcup@:rmcup@'
  #     # set -ga terminal-overrides ",xterm-256color:Tc"
  #     # set -g default-terminal "xterm-256color"
  #     # set -g status-style 'bg=#1E272C,fg=#6A7D89'
  #     set -g window-status-current-style 'fg=cyan'
  #     set -g mode-style 'bg=colour6,fg=colour0'
  #     set -g message-style 'fg=colour6'
  #     set -g pane-border-style 'fg=colour0'
  #     set -g pane-active-border-style 'fg=colour8'
  #     # set -g history-limit 10000

  #     setw -g automatic-rename off

  #     bind '"' split-window -c "#{pane_current_path}"
  #     bind % split-window -h -c "#{pane_current_path}"
  #     bind c new-window -c "#{pane_current_path}"

  #     unbind -n C-k
  #     unbind -n C-j
  #     unbind ]

  #     # List of plugins
  #     set -g @plugin 'tmux-plugins/tpm'
  #     set -g @plugin "arcticicestudio/nord-tmux"
  #     set -g @plugin 'nhdaly/tmux-better-mouse-mode'
  #     # set -g @plugin 'tmux-plugins/tmux-yank'
  #     set -g @plugin 'tmux-plugins/tmux-sensible'
  #     # set -g @plugin 'tmux-plugins/tmux-copycat'
  #     # set -g @plugin 'Morantron/tmux-fingers'
  #     set -g @plugin 'tmux-plugins/tmux-open'
  #     set -g @plugin 'tmux-plugins/tmux-prefix-highlight'
  #     set -g @plugin 'jbnicolai/tmux-fpp'

  #     # Other examples:
  #     # set -g @plugin 'github_username/plugin_name'
  #     # set -g @plugin 'git@github.com/user/plugin'
  #     # set -g @plugin 'git@bitbucket.com/user/plugin'

  #     # bind-key -T copy-mode-vi MouseDragEnd1Pane send -X copy-pipe "xclip -selection clipboard -i" \; send -X clear-selection

  #     # set -g @yank_selection 'clipboard'
  #     # set -g @yank_selection_mouse 'clipboard'
  #     # set -g @yank_action 'copy-pipe'
  #     set -g @emulate-scroll-for-no-mouse-alternate-buffer "on"
  #     set -g @copycat_search_G '\b[0-9a-f]{5,40}\b'
  #     set -g @fingers-key f
  #     set -g @fingers-compact-hints 0
  #     set -g @fingers-hint-position-nocompact "left"
  #     # set -g @custom_copy_command 'xclip -selection clipboard'

  #     # run-shell "powerline-daemon -q"
  #     # source "/usr/local/lib/python3.5/dist-packages/powerline/bindings/tmux/powerline.conf"

  #     # Initialize TMUX plugin manager (keep this line at the very bottom of tmux.conf)
  #     run '~/.tmux/plugins/tpm/tpm'
  #   '';
}
