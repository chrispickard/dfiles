{ config, lib, pkgs, ... }:

{
  home.packages = with pkgs; [ xclip rofi ];
  services.unclutter = { enable = true; };
  xsession = {
    enable = true;
    windowManager.i3 = rec {
      enable = true;
      config = {
        modifier = "Mod4";
        bars = [{
          statusCommand = "${pkgs.i3status}/bin/i3status";
          fonts = [ "Iosevka 8" ];
          colors = {
            separator = "#aea79f";
            background = "#2E3440";
            statusline = "#aea79f";
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
              border = "#B48EAD";
              background = "#B48EAD";
              text = "#ffffff";
            };
          };
        }];

        window = { hideEdgeBorders = "both"; };
        focus = {
          followMouse = false;
          mouseWarping = false;
          newWindow = "smart";
        };

        keybindings = let
          mod = config.modifier;
          leader = "Mod1 + Shift";
        in {
          # "${leader}+j" = "exec btf -m Gnome-terminal gnome-terminal";
          # "${leader}+j" = "exec btf -m XTerm xterm";
          # "${leader}+j" =
          #   "exec btf -m \"kitty@chris\" kitty";
          # "${leader}+j" = "exec btf -m UXTerm uxterm";
          # "${leader}+j" = "exec btf -m URxvt urxvt";
          "${leader}+e" = "exec btf -m emacs@chris emacs";
          "${leader}+c" = "exec btf -m Firefox firefox";
          "${leader}+s" = "exec btf -m Slack slack";
          "${leader}+t" = ''exec btf -m "Microsoft Teams" /home/chris.pickard/bin/teams-timeout'';
          "${leader}+k" = "exec btf -m Code code";
          "${leader}+h" = ''exec btf -m "DI2E Framework Jira" firefox'';
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
          "${mod}+s" = "layout stacking";
          "${mod}+t" = "layout tabbed";
          "${mod}+e" = "layout toggle split";
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
          "${mod}+Shift+e" = ''
            exec "i3-nagbar -t warning -m 'You pressed the exit shortcut. Do you really want to exit i3? This will end your X session.' -b 'Yes, exit i3' 'i3-msg exit'"'';
        };
        modes.resize = {
          "j" = "resize shrink width 10 px or 10 ppt";
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
          {
            command =
              "feh --bg-fill $HOME/.background_l --bg-fill $HOME/.background_r";
            notification = false;
          }
        ];
      };
      extraConfig = ''
        new_window pixel 1
        #focus_on_window_activation smart
        for_window [class="floating"] floating enable
        for_window [class="Firefox" title="Developer Tools"] floating enable
        for_window [title="Microsoft Teams Notification"] floating enable
        no_focus [title="Microsoft Teams Notification"]
        for_window [class="Firefox" title="Developer Tools"] resize set 900 480
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
  home.file."bin/teams-timeout" = {
    text = ''
      #!/bin/sh
      XDG_CONFIG_HOME=~/.config/teams/ teams
    '';
    executable = true;
  };
  home.file."bin/pbcopy" = {
    text = ''
      #!/bin/sh
      xclip -sel clipboard $@
    '';
    executable = true;
  };
  home.file."bin/pbpaste" = {
    text = ''
      #!/bin/sh
      xclip -sel clipboard -o $@
    '';
    executable = true;
  };
}
