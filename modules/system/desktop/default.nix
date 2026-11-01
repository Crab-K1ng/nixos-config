{ ... }: {
  flake.nixosModules.desktop = { ... }: {
    # Enable Plasma
    services = {
      desktopManager.plasma6.enable = true;

      # Default display manager for Plasma
      displayManager.plasma-login-manager.enable = true;

      # Enable xserver
      xserver.enable = true;
    };
  };
}
