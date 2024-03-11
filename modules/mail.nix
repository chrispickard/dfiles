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
        astroid = {
          enable = true;
          sendMailCommand = "${pkgs.gmailieer}/bin/gmi send -t -C ~/.mail/work";
        };
      };
      personal = {
        address = "${personal}";
        userName = "${personal}";
        flavor = "gmail.com";
        primary = false;
        lieer = { enable = true; };
        realName = "${name}";
        notmuch.enable = true;
        astroid = {
          enable = true;
          sendMailCommand =
            "${pkgs.gmailieer}/bin/gmi send -t -C ~/.mail/personal";
        };
      };
      tpf = {
        address = "${tpf}";
        userName = "${tpf}";
        flavor = "gmail.com";
        primary = false;
        lieer = { enable = true; };
        realName = "${name}";
        notmuch.enable = true;
        astroid = {
          enable = true;
          sendMailCommand = "${pkgs.gmailieer}/bin/gmi send -t -C ~/.mail/tpf";
        };
      };
    };
  };

  xsession.windowManager.i3.config.keybindings = let leader = "Mod1 + Shift";
  in { "${leader}+t" = "exec btf -m Astroid /usr/bin/astroid"; };
  programs = {
    notmuch = {
      enable = true;
      hooks = {
        preNew =
          "${pkgs.astroid}/bin/astroid --start-polling || true && ${syncmymail}/bin/syncmymail";
        postNew =
          "${pkgs.afew}/bin/afew -C ${notmuchrc} --tag --new --verbose; ${pkgs.astroid}/bin/astroid --stop-polling || true";
      };
      new = {
        ignore = [ "trash" "*.json" ];
        tags = [ "new" ];
      };
      search.excludeTags = [ "trash" "deleted" "spam" ];
      maildir.synchronizeFlags = true;
    };
    lieer = { enable = true; };
    astroid = {
      enable = true;
      extraConfig = {
        thread_view.preferred_type = "html";
        editor = {
          cmd = "emacsclient -q -c %1";
          external_editor = true;
        };
      };
    };
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
