{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    pkg = {
      flake = false;
      url = "https://mega.nz/linux/repo/Arch_Extra/x86_64/megacmd-x86_64.pkg.tar.zst";
    };
  };
  outputs =
    { self, nixpkgs, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
      megacmd = pkgs.callPackage ./. {
        inherit (inputs) pkg;
      };
    in
    {
      packages.${system}.default = megacmd;
    };
}
