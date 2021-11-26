{ pkgs ? import <nixpkgs> { }, stdenv ? pkgs.stdenv, lib ? pkgs.lib
, buildGoModule ? pkgs.buildGoModule, fetchFromGitHub ? pkgs.fetchFromGitHub
  # We use this to add matchers for stuff that's not in upstream nixpkgs, but is
  # in our own overlay. No fuzzy matching from multiple options here, it's just:
  # Was the command `, mything`? Run `nixpkgs.mything`.
, overlayPackages ? [ ], ... }:

buildGoModule rec {
  pname = "joe";
  version = "0.0.4";

  src = lib.cleanSource ./.;

  # vendorSha256 = lib.fakeSha256;
  vendorSha256 = "p3RPQzL6/1A5NzlDL12yd7WucweC6TkstNYkZPO5m+0=";

  meta = with lib; {
    homepage = "https://github.com/chrispickard/btf";
    description = "A simple, keyboard driven app switcher/launcher for x11";
    license = licenses.asl20;
  };
}
