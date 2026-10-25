{ ... }: {
  flake.nixosModules.imports = { ... }: {
    imports = [
      /home/crab/vms/nixos-vm/my-dendritic/_hardware-configuration.nix
    ];
  };
}
