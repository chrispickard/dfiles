{ config, lib, pkgs, ... }:

let
  name = "Chris Pickard";
  maildir = "/home/chrispickard/.mail";
  email = "chris.pickard@tangramflex.com";
  personal = "chrispickard9@gmail.com";
  tpf = "thephoenixforce9@gmail.com";
  notmuchrc = "/home/chrispickard/.config/notmuch/default/config";

  syncmymail = pkgs.writeShellScriptBin "syncmymail" ''
    ${pkgs.gmailieer}/bin/gmi sync -C ~/.mail/work --limit=100
    ${pkgs.gmailieer}/bin/gmi sync -C ~/.mail/personal --limit=100
    ${pkgs.gmailieer}/bin/gmi sync -C ~/.mail/tpf --limit=100
  '';
in {
  imports = [ ./afew.nix ];
  home.packages = with pkgs; [ notmuch gmailieer syncmymail w3m ];

  accounts.email = {
    maildirBasePath = "${maildir}";
    accounts = {
      work = {
        address = "${email}";
        userName = "${email}";
        flavor = "gmail.com";
        primary = true;
        lieer = { enable = true; };
        realName = "${name}";
        notmuch.enable = true;
      };
      personal = {
        address = "${personal}";
        userName = "${personal}";
        flavor = "gmail.com";
        primary = false;
        lieer = { enable = true; };
        realName = "${name}";
        notmuch.enable = true;
      };
      tpf = {
        address = "${tpf}";
        userName = "${tpf}";
        flavor = "gmail.com";
        primary = false;
        lieer = { enable = true; };
        realName = "${name}";
        notmuch.enable = true;
      };
    };
  };

  programs = {
    notmuch = {
      enable = true;
      hooks = {
        preNew = "${syncmymail}/bin/syncmymail";
        postNew = "${pkgs.afew}/bin/afew -C ${notmuchrc} --tag --new --verbose";
      };
      new = {
        ignore = [ "trash" "*.json" ];
        tags = [ "new" ];
      };
      search.excludeTags = [ "trash" "deleted" "spam" ];
      maildir.synchronizeFlags = true;
    };
    lieer = { enable = true; };
  };
  systemd.user.services.syncmail = {
    Unit = {
      Description = "sync mail via lieer and then notmuch new it";
      X-RestartIfChanged = true;
    };
    Service = {
      Type = "oneshot";
      ExecStart = "${pkgs.notmuch}/bin/notmuch new";
      WorkingDirectory = config.accounts.email.maildirBasePath;
    };
    Install.WantedBy = [ "default.target" ];
  };

  systemd.user.timers.syncmail = {
    Unit = {
      Description = "sync mail via lieer and then notmuch new it";
      X-RestartIfChanged = true;
    };
    Timer = { OnUnitActiveSec = "30s"; };
    Install.WantedBy = [ "timers.target" ];
  };
}
