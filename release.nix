let
  pkgs = import <nixpkgs> { };

in
  { neighbour-squasher = pkgs.haskellPackages.callPackage ./default.nix { };
  }
