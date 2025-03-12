{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/release-24.05";
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-doom-emacs = {
      url = "github:nix-community/nix-doom-emacs";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    comma = {
      url = "github:Shopify/comma/60a4cf8ec5c93104d3cfb9fc5a5bac8fb18cc8e4";
      flake = false;
    };
    btf = {
      url = "github:chrispickard/btf";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    mozilla-overlay = {
      url = "github:mozilla/nixpkgs-mozilla";
      flake = false;
    };
    emacs-overlay = {
      url = "github:nix-community/emacs-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zigpkgs = {
      url = "github:mitchellh/zig-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    { self
    , nixpkgs
    , nixpkgs-stable
    , home-manager
    , mozilla-overlay
    , emacs-overlay
    , comma
    , btf
    , nix-doom-emacs
    , zigpkgs
    }:
    let
      system = "x86_64-linux";
      overlay-stable = final: prev: {
        stable =
          nixpkgs-stable.legacyPackages.${prev.system}; # considering nixpkgs-stable is an input registered before.
        astroid = pkgs.stable.astroid;
      };
      pkgs = import nixpkgs {
        inherit system;
        inherit (pkgs) lib;
        overlays = [
          # to use the stable overlay, use something like pkgs.stable.iosevka
          overlay-stable
          (import mozilla-overlay)
          (import emacs-overlay)
          (final: prev: { zigpkgs = import zigpkgs { inherit (prev) pkgs; inherit system; }; })
          (final: prev: { comma = import comma { inherit (prev) pkgs; }; })
          (final: prev: { btf = import btf { inherit (prev) pkgs; }; })
        ];
        config.allowUnfree = true;
        config.permittedInsecurePackages = [
          "electron-25.9.0"
        ];
      };
      user = "chris";
      work_user = "chrispickard";
    in
    {
      homeConfigurations."${user}" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          nix-doom-emacs.hmModule
          {
            home = {
              username = "${user}";
              homeDirectory = "/home/${user}";
              stateVersion = "22.05";
            };
          }
          ./home.nix
        ];
      };
      homeConfigurations."${work_user}" =
        home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [
            nix-doom-emacs.hmModule
            ./home.nix
            {
              home = {
                username = "${work_user}";
                homeDirectory = "/home/${work_user}";
                stateVersion = "22.05";
              };
            }
          ];
        };

      joe = pkgs.callPackage pkgs.home-manager { };

      apps."${system}".joe = {
        type = "app";
        program = "${self.joe}/bin/home-manager";
      };
      devShell."${system}" = pkgs.mkShell { nativeBuildInputs = [ self.joe ]; };
      defaultApp."${system}" = self.apps."${system}".joe;
    };
}
