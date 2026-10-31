{ ... }: {
  flake.nixosModules.imports = { ... }: {
    imports = [
      ./_hardware-configuration.nix
    ];
  };
}
