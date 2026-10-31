{ inputs, ... }: {
  perSystem = { system, ... }: {
    _module.args = {
      unstablePkgs = import inputs.nixpkgs-unstable {
        inherit system;
      };
    };
  };

  flake.nixosModules.nix = { ... }: {
    nix.settings.experimental-features = [
      "nix-command"
      "flakes"
    ];
  };
}
