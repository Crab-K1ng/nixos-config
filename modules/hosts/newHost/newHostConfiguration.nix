{ ... }: {
  flake.nixosModules.newHostConfiguration = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      fastfetch
    ];

    imports = [
      /home/crab/vms/nixos-vm/my-dendritic/_hardware-configuration.nix
    ];
  };
}
