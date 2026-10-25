{ ... }: {
  flake.nixosModules.hostConfiguration = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      git
    ];

    imports = [
      /home/crab/vms/nixos-vm/my-dendritic/_hardware-configuration.nix
    ];
  };
}
