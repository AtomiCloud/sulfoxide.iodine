{ pkgs, pkgs-2505, pkgs-unstable, atomi }:
let

  all = {
    atomipkgs = (
      with atomi;
      {
        inherit
          atomiutils
          infrautils
          infralint
          sg
          pls;
      }
    );
    nix-unstable = (
      with pkgs-unstable;
      { }
    );
    nix-2505 = (
      with pkgs-2505;
      {
        inherit
          git
          infisical
          treefmt
          gitlint
          shellcheck
          vcluster
          ;
      }
    );
  };
in
with all;
nix-2505 //
nix-unstable //
atomipkgs
