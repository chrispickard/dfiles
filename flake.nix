{
  inputs = {
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    comma = {
      url = "github:Shopify/comma/60a4cf8ec5c93104d3cfb9fc5a5bac8fb18cc8e4";
      flake = false;
    };
  };

  outputs = { self, nixpkgs, home-manager, nur, comma }: {
    homeConfigurations."chrispickard" =
      home-manager.lib.homeManagerConfiguration {
        system = "x86_64-linux";
        homeDirectory = "/home/chrispickard";
        username = "chrispickard";
        stateVersion = "21.05";

        configuration = ./home.nix;

        pkgs = import nixpkgs {
          system = "x86_64-linux";
          overlays = [
            nur.overlay
            (final: prev: { comma = import comma { inherit (prev) pkgs; }; })
          ];
          config.allowUnfree = true;
        };

      };
  };
}