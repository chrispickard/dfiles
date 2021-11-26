# My Dotfiles
my dotfiles are configured via `nix`, `nix flakes`, and `home-manager`

install nix if you haven't already

```shell
curl -L https://nixos.org/nix/install | sh
```

allow the nix command to use flakes (currently experimental)

```shell
mkdir -p ~/.config/nix/
echo "experimental-features = nix-command flakes" >> ~/.config/nix/nix.conf
```

switch to the new configuration

```shell
nix run .\# switch
```
