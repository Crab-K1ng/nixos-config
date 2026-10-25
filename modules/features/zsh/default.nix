{
  inputs,
  lib,
  moduleWithSystem,
  ...
}:
{
  flake.nixosModules.zsh = moduleWithSystem (
    { pkgs, self', ... }: {

      nixpkgs.overlays = [
        (final: prev: {
          zsh = self'.packages.zsh;
        })
      ];

      programs.zsh = {
        enable = true;
      };
    }
  );
  perSystem = { pkgs, ... }: {
    packages.zsh = inputs.wrappers.wrappers.zsh.wrap {
      inherit pkgs;
      zshAliases = {
        some = lib.getExe pkgs.fastfetch;
        cat = lib.getExe pkgs.bat;
      };
    };
  };
}
