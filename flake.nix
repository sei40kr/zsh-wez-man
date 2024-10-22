{
  inputs = {
    flake-parts.url = "github:hercules-ci/flake-parts";

    nixpkgs.url = "github:NixOS/nixpkgs/23.05";
  };

  outputs =
    {
      self,
      flake-parts,
      nixpkgs,
    }@inputs:
    let
      inherit (flake-parts.lib) mkFlake;
    in
    mkFlake { inherit inputs; } {
      systems = [ "x86_64-linux" ];

      perSystem =
        { config, pkgs, ... }:
        {
          devShells.default = pkgs.callPackage ./dev-shell.nix { zsh-wez-man = ./.; };
        };
    };
}
