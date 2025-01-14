{
  description = "Nix template for Haskell projects";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
    flake-parts.inputs.nixpkgs-lib.follows = "nixpkgs";
    nixos-unified.url = "github:srid/nixos-unified";
    haskell-flake.url = "github:srid/haskell-flake";
    fourmolu-nix.url = "github:jedimahdi/fourmolu-nix";

    hsBlog = {
      type = "git";
      url = "ssh://git@github.com/rsrohitsingh682/hsBlog.git";
      ref = "main";
      rev = "8cbe5d073bd8e47d5616d4150723b6970f6136af";
    };

    git-hooks.url = "github:cachix/git-hooks.nix";
    git-hooks.flake = false;
  };

  outputs = inputs:
    # This will import ./nix/modules/flake-parts/*.nix
    # cf. https://nixos-unified.org/autowiring.html#flake-parts
    #
    # To write your own Nix, add or edit files in ./nix/modules/flake-parts/
    inputs.nixos-unified.lib.mkFlake
      { inherit inputs; root = ./.; };
}
