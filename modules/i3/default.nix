{ config, lib, pkgs, ... }:

{
  home.packages = with pkgs; [ xclip xsel rofi autorandr ];
  services.unclutter = { enable = true; };
  xsession = {
    enable = true;
    windowManager.i3 = rec {
      enable = true;
      config = {
        modifier = "Mod4";
        bars = [{
          statusCommand = "${pkgs.i3status}/bin/i3status";
          fonts = {
            names = [ "Iosevka" ];
            size = 9.0;
          };
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

        keybindings =
          let
            mod = config.modifier;
            leader = "Mod1 + Shift";
          in
          {
            "${leader}+n" = "exec open-element";
            "${leader}+s" = "exec open-slack";
            "${leader}+d" = "exec open-discord";
            "${leader}+i" = "exec open-idea";
            "${mod}+space" = "exec rofi -show drun";
            "${mod}+Shift+space" = "exec rofi -show run";
            "${mod}+Shift+grave" = "move scratchpad";
            "${mod}+grave" = "scratchpad show";
            "${mod}+h" = "focus left";
            "${mod}+j" = "focus down";
            "${mod}+r" = "mode resize";
            "${mod}+l" = "focus right";
            "${mod}+v" = "split v";
            "${mod}+f" = "fullscreen";
            "${mod}+t" = "layout tabbed";
            # "${mod}+e" = "layout toggle split";
            "${mod}+Shift+f" = "floating toggle";
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

            "${mod}+Shift+h" = "move left";
            "${mod}+Shift+j" = "move down";
            "${mod}+Shift+k" = "move up";
            "${mod}+Shift+l" = "move right";

            "${mod}+Ctrl+Shift+h" = "move workspace to output left";
            "${mod}+Ctrl+Shift+j" = "move workspace to output down";
            "${mod}+Ctrl+Shift+k" = "move workspace to output up";
            "${mod}+Ctrl+Shift+l" = "move workspace to output right";

            # gnome control
            "${mod}+d" = "exec regolith-control-center --class=floating display";
            "${mod}+b" =
              "exec regolith-control-center --class=floating bluetooth";
            "${mod}+s" = "exec regolith-control-center --class=floating sound";

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
            command = "xset r rate 200 150";
            notification = false;
          }
          {
            command = "xscreensaver &";
            notification = false;
          }
          {
            command = "${pkgs.unclutter-xfixes}/bin/unclutter --fork";
            notification = false;
          }
          {
            command = ''
              gsettings set org.gnome.settings-daemon.plugins.media-keys screensaver "['<Super>Escape']"'';
            notification = false;
          }
          {
            command =
              let
                wallpaper = builtins.fetchurl {
                  url = "https://www.pexels.com/photo/1072179/download";
                  sha256 = "0w4f20yki4rbbd1zdx8f136w4rqd8sc88ncp6z5y2jx4dv2xq5aj";
                };
              in
              "feh --bg-center ${wallpaper}";
            notification = false;
          }
        ];
      };
      extraConfig = ''
        new_window pixel 1
        #focus_on_window_activation smart
        for_window [class="floating"] floating enable
        for_window [class="1Password"] floating enable
        for_window [class="Firefox" title="Developer Tools"] floating enable
        for_window [title="Microsoft Teams Notification"] floating enable
        for_window [title="emacs-everywhere@chris"] floating enable
        for_window [class="Qemu-system-ppc"] floating enable
        no_focus [title="Microsoft Teams Notification"]
        for_window [class="Firefox" title="Developer Tools"] resize set 900 480
        client.focused          #4c7899 #285577 #ffffff #2e9ef4   #1E272C
        for_window [class="^.*"] border pixel 1
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
  home.file."bin/open-idea" = {
    text = ''
      #!/bin/sh
      . ~/.nix-profile/etc/profile.d/hm-session-vars.sh
      btf -m jetbrains- idea-ultimate
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
  home.file."bin/open-slack" = {
    text = ''
      #!/bin/sh
      . ~/.nix-profile/etc/profile.d/hm-session-vars.sh
      btf -m Slack slack
    '';
    executable = true;
  };

  home.file."bin/open-element" = {
    text = ''
      #!/bin/sh
      . ~/.nix-profile/etc/profile.d/hm-session-vars.sh
      btf -m 'Element' ${pkgs.element-desktop}/bin/element-desktop
    '';
    executable = true;
  };

  home.file."bin/open-discord" = {
    text = ''
      #!/bin/sh
      . ~/.nix-profile/etc/profile.d/hm-session-vars.sh
      btf -m Discord discord
    '';
    executable = true;
  };
  # services.taffybar = { enable = true; };
}
