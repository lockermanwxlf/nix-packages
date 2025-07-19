# nix-packages

Flakes for nix packages.

# Usage

Example package megacmd-bin

### Getting a package input:

flake.nix
```nix
{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    megacmd = {
      url = "github:lockermanwxlf/nix-packages?dir=megacmd-bin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs =
    {
      self,
      nixpkgs
      ...
    }@inputs:
    {
      nixosConfigurations.hostname =
        let
          system = "x86_64-linux";
        in
        nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = inputs;
          modules = [ ./configuration.nix ];
        };
    };
}

```

### Usage in configuration:

configuration.nix
```nix
  { megacmd }: 
    megacmd.packages.x86_64-linux.default,
```
