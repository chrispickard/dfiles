{ config, lib, pkgs, ... }:

{
  services.espanso = {
    enable = true;
    settings = {
      matches = [
        { # Simple text replacement
          trigger = ",espanso";
          replace = "Hi there!";
        }
        { # Dates
          trigger = ",date";
          replace = "{{mydate}}";
          vars = [{
            name = "mydate";
            type = "date";
            params = { format = "%m/%d/%Y"; };
          }];
        }
        { # Shell commands
          trigger = ",shell";
          replace = "{{output}}";
          vars = [{
            name = "output";
            type = "shell";
            params = { cmd = "echo Hello from your shell"; };
          }];
        }
      ];
    };
  };
}
