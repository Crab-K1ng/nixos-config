{ inputs, moduleWithSystem, ... }:
{
  flake.nixosModules.fish = moduleWithSystem (
    { self', pkgs, ... }: {
      programs.fish = {
        enable = true;
        package = self'.packages.fish;
      };

      programs.bat = {
        enable = true;
        extraPackages = with pkgs.bat-extras; [ batman ];

      };
    }
  );

  perSystem =
    { lib, pkgs, ... }:
    {
      packages.fish = inputs.wrappers.wrappers.fish.wrap {
        inherit pkgs;
        runtimePkgs = [ pkgs.fzf ]; # batman for searching

        abbreviations = {
        };
        shellAliases = {
          cat = lib.getExe pkgs.bat;
          rcat = lib.getExe' pkgs.coreutils "cat";

          lg = lib.getExe pkgs.lazygit;
        };
      };
    };
}
