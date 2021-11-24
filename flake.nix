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
  };

  outputs = { self, nixpkgs, home-manager, nur, comma, btf }: {
    homeConfigurations."chrispickard" =
      home-manager.lib.homeManagerConfiguration {
        system = "x86_64-linux";
        homeDirectory = "/home/chrispickard";
        username = "chrispickard";
        stateVersion = "21.11";

        pkgs = import nixpkgs {

          system = "x86_64-linux";
          overlays = [
            #     nur.overlay
            (final: prev: { comma = import comma { inherit (prev) pkgs; }; })
            (final: prev: { btf = import btf { inherit (prev) pkgs; }; })
          ];
          config.allowUnfree = true;
        };

        configuration.imports = [ ./home.nix ];

      };
  };
}
