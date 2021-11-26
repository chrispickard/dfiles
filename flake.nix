{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    comma = {
      url = "github:Shopify/comma/60a4cf8ec5c93104d3cfb9fc5a5bac8fb18cc8e4";
      flake = false;
    };
    btf = {
      url = "github:chrispickard/btf/15db424dc4786770409e0bf2573093366845ed44";
      flake = false;
    };
    mozilla-overlay = {
      url = "github:mozilla/nixpkgs-mozilla";
      flake = false;
    };
    emacs-overlay.url = "github:nix-community/emacs-overlay";
  };

  outputs =
    { self, nixpkgs, home-manager, mozilla-overlay, emacs-overlay, comma, btf }:
    let sys = "x86_64-linux";
    in {
      homeConfigurations."chrispickard" =
        home-manager.lib.homeManagerConfiguration {
          system = sys;
          homeDirectory = "/home/chrispickard";
          username = "chrispickard";
          stateVersion = "21.11";

          pkgs = import nixpkgs {

            system = sys;
            overlays = [
              (import mozilla-overlay)
              (import emacs-overlay)
              (final: prev: { comma = import comma { inherit (prev) pkgs; }; })
              (final: prev: { btf = import btf { inherit (prev) pkgs; }; })
            ];
            config.allowUnfree = true;
          };

          configuration.imports = [ ./home.nix ];

        };

      defaultApp."${sys}" = {
        type = "app";
        program = "./bin/hola";
      };

    };
}
