{ config, pkgs, ... }:

{
  home.packages = [ pkgs.firefox-bin ];
  home.file.".mozilla/native-messaging-hosts/tridactyl.json".source =
    "${pkgs.tridactyl-native}/lib/mozilla/native-messaging-hosts/tridactyl.json";
  # xdg.configFile."tridactyl/tridactylrc".source = ./tridactylrc;
  xdg.configFile."tridactyl" = {
    source = ./tridactyl;
    # recursive = true;
  };

}
