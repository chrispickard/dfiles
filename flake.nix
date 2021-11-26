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
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        overlays = [
          (import mozilla-overlay)
          (import emacs-overlay)
          (final: prev: { comma = import comma { inherit (prev) pkgs; }; })
          (final: prev: { btf = import btf { inherit (prev) pkgs; }; })
          (final: prev: { myJoe = import self.myJoe { inherit (prev) pkgs; }; })
        ];
        config.allowUnfree = true;
      };
      lib = nixpkgs.lib;
      user = "chrispickard";
    in {
      homeConfigurations."${user}" = home-manager.lib.homeManagerConfiguration {
        inherit system pkgs;
        homeDirectory = "/home/${user}";
        username = "${user}";
        stateVersion = "21.11";

        configuration.imports = [ ./home.nix ];

      };
      myJoe = ./joe;

      joe = (pkgs.callPackage ./joe/default.nix { });

      apps."${system}".joe = {
        type = "app";
        program = "${self.joe}/bin/joe";
      };
      defaultApp."${system}" = {
        type = "app";
        program = ./bin/hola;
      };
    };
}
