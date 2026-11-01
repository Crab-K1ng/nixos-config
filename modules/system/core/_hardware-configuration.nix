# modules/hardware-configuration.nix
{ lib, modulesPath, ... }:

{
  imports = [
    (modulesPath + "/profiles/qemu-guest.nix")
  ];

  boot.initrd.availableKernelModules = [
    "ahci"
    "virtio_pci"
    "virtio_blk"
  ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ ];
  boot.extraModulePackages = [ ];

  fileSystems."/" = {
    device = "/dev/vda1";
    fsType = "ext4";
  };

  swapDevices = [ ];

  #for vms
  virtualisation.vmVariant = {
    virtualisation = {
      memorySize = 4096; # Set RAM to 4096 MiB (4 GB)
      cores = 4; # Set CPU cores
    };
  };

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
}
