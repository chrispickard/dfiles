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
      url = "github:chrispickard/btf";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    mozilla-overlay = {
      url = "github:mozilla/nixpkgs-mozilla";
      flake = false;
    };
    emacs-overlay.url = "github:nix-community/emacs-overlay";
  };

  outputs =
    { self, nixpkgs, home-manager, mozilla-overlay, emacs-overlay, comma, btf }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        inherit (pkgs) lib;
        overlays = [
          (import mozilla-overlay)
          (import emacs-overlay)
          (final: prev: { comma = import comma { inherit (prev) pkgs; }; })
          (final: prev: { btf = import btf { inherit (prev) pkgs; }; })
        ];
        config.allowUnfree = true;
      };
      user = "chris";
      work_user = "chrispickard";
    in {
      homeConfigurations."${user}" = home-manager.lib.homeManagerConfiguration {
        inherit system pkgs;
        homeDirectory = "/home/${user}";
        username = "${user}";
        stateVersion = "21.11";

        configuration.imports = [ ./home.nix ];

      };
      homeConfigurations."${work_user}" = home-manager.lib.homeManagerConfiguration {
        inherit system pkgs;
        homeDirectory = "/home/${work_user}";
        username = "${work_user}";
        stateVersion = "21.11";

        configuration.imports = [ ./home.nix ];

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
