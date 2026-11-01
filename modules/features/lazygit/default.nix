{ inputs, moduleWithSystem, ... }: {

  flake.nixosModules.lazygit = moduleWithSystem (
    { self', ... }: {
      environment.systemPackages = [
        self'.packages.lazygit
      ];
    }
  );

  perSystem =
    { pkgs, ... }:
    let
      config-file = pkgs.writeText "config.yml" ''
        gui:
          nerdFontsVersion: "3"
      '';
    in
    {
      packages.lazygit = inputs.wrappers.lib.wrapPackage {
        inherit pkgs;
        package = pkgs.lazygit;
        flags = {
          "--use-config-file" = config-file;
        };
      };
    };
}
