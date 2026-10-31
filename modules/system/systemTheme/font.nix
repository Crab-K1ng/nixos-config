{ ... }: {
  flake.nixosModules.font = { pkgs, ... }: {
    fonts = {
      enableDefaultPackages = true;
      packages = [
        pkgs.jetbrains-mono
      ];
    };

    console = {
      font = "ter-124b";
      packages = with pkgs; [
        terminus_font
      ];
    };
  };
}
