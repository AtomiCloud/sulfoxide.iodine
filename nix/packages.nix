{ pkgs, atomi, pkgs-feb-19-24 }:
let

  all = {
    atomipkgs = (
      with atomi;
      {
        inherit
          infisical
          pls
          sg;
      }
    );
    feb-19-24 = (
      with pkgs-feb-19-24;
      {
        inherit
          coreutils
          sd
          bash
          git
          jq
          yq-go
          skopeo

          # lint
          treefmt

          # infra
          vcluster
          k3d
          helm-docs
          kubectl
          gitlint
          shellcheck
          ;
        helm = kubernetes-helm;

      }
    );
  };
in
with all;
atomipkgs //
feb-19-24
