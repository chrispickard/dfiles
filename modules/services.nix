{ config, lib, pkgs, ... }:

{
  xsession.initExtra = ''
    systemctl --user import-environment DBUS_SESSION_BUS_ADDRESS DISPLAY XAUTHORITY XDG_DATA_DIRS XDG_RUNTIME_DIR XDG_SESSION_ID
  '';

  # services.gnome-keyring = {
  #   enable = true;
  #   components = [ "pkcs11" "secrets" ];
  # };
  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
    enableFishIntegration = true;
  };
  services.dunst = {
    # enable = true;
    enable = false;
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
  # systemd.user.services.blackd = {
  #   Unit.Description = "blackd: the uncompromising code formatter";
  #   Service = {
  #     ExecStart = "${pkgs.python38Packages.black}/bin/blackd";
  #     Restart = "on-failure";
  #   };
  #   Install.WantedBy = [ "default.target" ];
  # };
}
