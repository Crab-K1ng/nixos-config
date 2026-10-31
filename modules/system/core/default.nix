{ self, ... }: {
  flake.nixosModules.system =
    { ... }:
    let
      modules = with self.nixosModules; [
        nix
        bootloader
        user
        locale
        networking
        imports
      ];
    in
    {
      imports = modules;
    };
}
