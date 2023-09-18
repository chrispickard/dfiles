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
    # tmuxp.enable = true;
    plugins = with pkgs; [
      tmuxPlugins.extrakto
      tmuxPlugins.nord
      tmuxPlugins.prefix-highlight
      tmuxPlugins.yank
      {
        plugin = tmuxPlugins.better-mouse-mode;
        extraConfig = ''
          set -g mouse on
          set -g @emulate-scroll-for-no-mouse-alternate-buffer on
        '';
      }
    ];
    extraConfig = ''
      # set -g terminal-overrides ',rxvt-unicode-256color:Tc'
      bind -n M-h select-pane -L
      bind -n M-j select-pane -D
      bind -n M-k select-pane -U
      bind -n M-l select-pane -R

      bind -n M-m select-pane -t :.+
      bind -n M-n next-window
      bind -n M-p previous-window
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

      # bind -n WheelUpPane copy-mode
      # set-option -g mouse on

      # set -g @emulate-scroll-for-no-mouse-alternate-buffer "on"
      # run-shell ~/tmux-better-mouse-mode/scroll_copy_mode.tmux
    '';
  };
  home.file.".tmuxp/work.yaml".text = ''
    session_name: work
    windows:
      - window_name: ""
        panes:
          - focus: true
          - null
  '';
}
