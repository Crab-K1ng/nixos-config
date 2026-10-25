{ ... }: {
  flake.nixosModules.newHostConfiguration = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      fastfetch
    ];
  };
}
