{ ... }: {
  flake.nixosModules.bootloader = { pkgs, ... }: {
    boot = {
      loader = {
        # Set bootloader timeout
        timeout = 2;
        efi = {
          # Enable efi var mutation
          canTouchEfiVariables = true;
        };
        # Enable grub
        grub = {
          efiSupport = true;
          # Fix resolution issues
          device = "nodev";
        };
      };

      # Set kernel to latest available version
      kernelPackages = pkgs.linuxPackages_latest;
    };
  };
}
