{ config, pkgs, ... }:

{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  fonts.fontconfig.enable = true;
  home.stateVersion = "19.09";
  home.packages = with pkgs; [
    zsh
    go
    tmux
    emacs
    lastpass-cli
    direnv
    nodePackages.node2nix
    topgrade
    iosevka
    unclutter
    tig
    rofi
    sshuttle
    feh
    postman
    playerctl
    fzf
    jq
    ripgrep
    curl
    fd
    nodejs
    nodePackages.typescript-language-server
    nodePackages.npm
    nodePackages.prettier
    nodePackages.bash-language-server
  ];
  services.lorri = {
    enable = true;
  };
  services.gnome-keyring = {
    enable = true;
  };
  services.dunst = {
    enable = true;
    settings = {
      global = {
        geometry = "250-15+49";
        format = "<b>%s</b>\\n%b";
        word_wrap = true;
        transparency = 10;
        frame_color = "#eceff1";
        font = "Iosevka 11";
        alignment = "center";
        timeout = 10;
      };
      urgency_low = {
        frame_color = "#3B7C87";
        foreground = "#3B7C87";
        background = "#191311";
      };
      urgency_normal = {
        frame_color = "#3B7C87";
        foreground = "#5B8234";
        background = "#191311";
      };
      urgency_critical = {
        frame_color = "#B7472A";
        foreground = "#B7472A";
        background = "#191311";
      };
    };
  };

  programs.ssh = {
    enable = true;
  };

  programs.git = {
    enable = true;
    userName = "Chris Pickard";
    userEmail = "chris.pickard@altamiracorp.com";
    aliases = {
      co = "checkout";
      s = "status";
      a = "add";
    };
    extraConfig = {
      core = {
        editor = "emacsclient";
      };
    };
  };
  xsession = {
    enable = true;
    windowManager.i3 = rec {
      enable = true;
      config = {
        modifier = "Mod4";
        bars = [
          {
            statusCommand = "${pkgs.i3status}/bin/i3status";
            fonts = [ "Iosevka 8" ];
            colors = {
              separator = "#aea79f";
              background = "#2E3440";
              statusline =  "#aea79f";
              focusedWorkspace = {
                border = "#2E3440";
                background = "#4c566a";
                text = "#ffffff";
              };
              activeWorkspace = {
                border = "#2E3440";
                background = "#2E3440";
                text = "#ffffff";
              };
              inactiveWorkspace = {
                border = "#2E3440";
                background = "#2E3440";
                text = "#aea79f";
              };
              urgentWorkspace = {
                border = "#77216f";
                background = "#77216f";
                text = "#ffffff";
              };
            };
          }
        ];

        window = {
          hideEdgeBorders = "both";
        };
        focus = {
          followMouse = false;
          mouseWarping = false;
          newWindow = "smart";
        };
        
        keybindings = let
          mod = config.modifier;
          leader = "Mod1 + Shift";
        in {
          "${leader}+j" = "exec btf -m kitty kitty";
          "${leader}+e" = "exec btf -m emacs@chris emacs";
          "${leader}+c" = "exec btf -m Firefox /opt/firefox/firefox";
          "${leader}+h" = "exec btf -m \"DI2E Framework Jira\" /opt/firefox/firefox";
          "${mod}+d" = "exec rofi -show run";

          "${mod}+Shift+grave" = "move scratchpad";
          "${mod}+grave" = "scratchpad show";
          "${mod}+j" = "focus left";
          "${mod}+k" = "focus down";
          "${mod}+l" = "focus up";
          "${mod}+r" = "mode resize";
          "${mod}+semicolon" = "focus right";
          "${mod}+Left" = "focus left";
          "${mod}+Down" = "focus down";
          "${mod}+Up" = "focus up";
          "${mod}+Right" = "focus right";
          "${mod}+Shift+j" = "move left";
          "${mod}+Shift+k" = "move down";
          "${mod}+Shift+l" = "move up";
          "${mod}+Shift+semicolon" = "move right";
          "${mod}+Shift+Left" = "move left";
          "${mod}+Shift+Down" = "move down";
          "${mod}+Shift+Up" = "move up";
          "${mod}+Shift+Right" = "move right";
          "${mod}+h" = "split h";
          "${mod}+v" = "split v";
          "${mod}+f" = "fullscreen";
          "${mod}+Shift+s" = "layout stacking";
          "${mod}+Shift+t" = "layout tabbed";
          "${mod}+Shift+f" = "floating toggle";
          "${mod}+space" = "focus mode_toggle";
          "${mod}+1" = "workspace 1";
          "${mod}+2" = "workspace 2";
          "${mod}+3" = "workspace 3";
          "${mod}+4" = "workspace 4";
          "${mod}+5" = "workspace 5";
          "${mod}+6" = "workspace 6";
          "${mod}+7" = "workspace 7";
          "${mod}+8" = "workspace 8";
          "${mod}+9" = "workspace 9";
          "${mod}+0" = "workspace 10";
          "${mod}+Shift+1" = "move container to workspace 1";
          "${mod}+Shift+2" = "move container to workspace 2";
          "${mod}+Shift+3" = "move container to workspace 3";
          "${mod}+Shift+4" = "move container to workspace 4";
          "${mod}+Shift+5" = "move container to workspace 5";
          "${mod}+Shift+6" = "move container to workspace 6";
          "${mod}+Shift+7" = "move container to workspace 7";
          "${mod}+Shift+8" = "move container to workspace 8";
          "${mod}+Shift+9" = "move container to workspace 9";
          "${mod}+Shift+0" = "move container to workspace 10";
          "${mod}+Shift+r" = "restart";
          "${mod}+Shift+q" = "kill";
          "${mod}+Shift+e" = "exec \"i3-nagbar -t warning -m 'You pressed the exit shortcut. Do you really want to exit i3? This will end your X session.' -b 'Yes, exit i3' 'i3-msg exit'\"";
        };
        modes.resize = {
          "j"= "resize shrink width 10 px or 10 ppt";
          "k" = "resize grow height 10 px or 10 ppt";
          "l" = "resize shrink height 10 px or 10 ppt";
          "semicolon" = "resize grow width 10 px or 10 ppt";
          "Escape" = "mode default";
          "Return" = "mode default";
        };

        startup = [
          {
            command = "xset r rate 200 100";
            notification = false;
          }
        ];
      };
      extraConfig = ''
new_window pixel 1
#focus_on_window_activation smart
for_window [class="floating"] floating enable
client.focused          #4c7899 #285577 #ffffff #2e9ef4   #1E272C
      '';
    };

  };

  home.file.".i3status.conf".text = ''
    general {
            colors = true
            interval = 5
    }
    order += "tztime local"
    tztime local {
            format = "%Y-%m-%d %H:%M:%S"
    }
  '';
  home.file.".tmux.conf".text = ''
set -g prefix M-a
unbind C-b
bind M-a send-prefix

# force a reload of the config file
unbind r
bind r source-file ~/.tmux.conf

# set-option -g default-command "reattach-to-user-namespace -l zsh"

# # quick pane cycling
# unbind ^A
# bind ^A select-pane -t :.+

# mouse options
# setw -g mouse-select-pane on
# set -g mouse-resize-pane on
# set -g mouse-select-window on
bind -n WheelUpPane copy-mode
set-option -g mouse on
# set-option -g mouse-select-pane on

set -g base-index 1
set -g pane-base-index 1

# improve colors
set -g default-terminal "xterm-kitty"
set-option  -ga terminal-overrides  ",xterm-kitty:Tc"
# set -g default-terminal "xterm-256color"
# set -g terminal-overrides ',xterm-256color:Tc'

set-option -g allow-rename off

# Set colors
set -g status-left-length 52
set -g status-right-length 20
set -g status-fg white
set -g status-bg colour234
# set -g window-status-activity-attr bold
# set -g pane-border-fg colour245
# set -g pane-active-border-fg colour39
# set -g message-fg colour16
# set -g message-bg colour221
# set -g message-attr bold
set -g status-left '#[fg=colour235,bg=colour252,bold] #S #[fg=colour252,bg=colour238,nobold]#[fg=colour245,bg=colour238,bold] #(whoami)#[fg=colour238,bg=colour234,nobold]'
set -g status-right \'\'
setw -g mode-keys vi

bind h select-pane -L
bind j select-pane -D
bind k select-pane -U
bind l select-pane -R

bind -n M-h select-pane -L
bind -n M-j select-pane -D
bind -n M-k select-pane -U
bind -n M-l select-pane -R

bind -n M-m select-pane -t :.+
bind -n M-n next-window

bind -n M-p previous-window

# bind-key -t vi-copy MouseDragEnd1Pane copy-pipe "xclip -sel clip"
# bind y run-shell "tmux show-buffer | xclip -sel clip -i" \; display-message "Copied tmux buffer to system clipboard"

# set-option -s set-clipboard on
# bind-key -T copy-mode-vi MouseDragEnd1Pane send-keys -X copy-pipe-and-cancel "xclip -se c -i"
# set -g set-clipboard on

bind-key -r C-h select-window -t :-
bind-key -r C-l select-window -t :+

set -sg escape-time 0

# Pretend our terminal doesn't support alternative screens, and thus all text
# should be placed into the scrollback buffer when it goes off the top of the
# screen.
# http://superuser.com/questions/310251/use-terminal-scrollbar-with-tmux
# set-option -ga terminal-overrides ',xterm*:smcup@:rmcup@'
# set -ga terminal-overrides ",xterm-256color:Tc"
# set -g default-terminal "xterm-256color"
# set -g status-style 'bg=#1E272C,fg=#6A7D89'
set -g window-status-current-style 'fg=cyan'
set -g mode-style 'bg=colour6,fg=colour0'
set -g message-style 'fg=colour6'
set -g pane-border-style 'fg=colour0'
set -g pane-active-border-style 'fg=colour8'
# set -g history-limit 10000

setw -g automatic-rename off

bind '"' split-window -c "#{pane_current_path}"
bind % split-window -h -c "#{pane_current_path}"
bind c new-window -c "#{pane_current_path}"

unbind -n C-k
unbind -n C-j
unbind ]

# List of plugins
set -g @plugin 'tmux-plugins/tpm'
set -g @plugin "arcticicestudio/nord-tmux"
set -g @plugin 'nhdaly/tmux-better-mouse-mode'
# set -g @plugin 'tmux-plugins/tmux-yank'
set -g @plugin 'tmux-plugins/tmux-sensible'
# set -g @plugin 'tmux-plugins/tmux-copycat'
# set -g @plugin 'Morantron/tmux-fingers'
set -g @plugin 'tmux-plugins/tmux-open'
set -g @plugin 'tmux-plugins/tmux-prefix-highlight'

# Other examples:
# set -g @plugin 'github_username/plugin_name'
# set -g @plugin 'git@github.com/user/plugin'
# set -g @plugin 'git@bitbucket.com/user/plugin'

bind-key -T copy-mode-vi MouseDragEnd1Pane send -X copy-pipe "xclip -selection clipboard -i" \; send -X clear-selection

# set -g @yank_selection 'clipboard'
# set -g @yank_selection_mouse 'clipboard'
# set -g @yank_action 'copy-pipe'
set -g @emulate-scroll-for-no-mouse-alternate-buffer "on"
set -g @copycat_search_G '\b[0-9a-f]{5,40}\b'
set -g @fingers-key f
set -g @fingers-compact-hints 0
set -g @fingers-hint-position-nocompact "left"
# set -g @custom_copy_command 'xclip -selection clipboard'

# run-shell "powerline-daemon -q"
# source "/usr/local/lib/python3.5/dist-packages/powerline/bindings/tmux/powerline.conf"


# Initialize TMUX plugin manager (keep this line at the very bottom of tmux.conf)
run '~/.tmux/plugins/tpm/tpm'
  '';
  xdg.configFile."kitty/kitty.conf".text = ''
# Nord Colorscheme for Kitty
# Based on:
# - https://gist.github.com/marcusramberg/64010234c95a93d953e8c79fdaf94192
# - https://github.com/arcticicestudio/nord-hyper

foreground            #D8DEE9
background            #2E3440
selection_foreground  #000000
selection_background  #FFFACD
url_color             #0087BD
cursor                #81A1C1

# black
color0   #3B4252
color8   #4C566A

# red
color1   #BF616A
color9   #BF616A

# green
color2   #A3BE8C
color10  #A3BE8C

# yellow
color3   #EBCB8B
color11  #EBCB8B

# blue
color4  #81A1C1
color12 #81A1C1

# magenta
color5   #B48EAD
color13  #B48EAD

# cyan
color6   #88C0D0
color14  #8FBCBB

# white
color7   #E5E9F0
Color15  #B48EAD


font_family Iosevka
bold_font auto
italic_font auto
bold_italic_font auto
font_size 10
hide_window_decorations yes
  '';
}
