{ inputs, ... }: {
  perSystem = { system, ... }: {
    _module.args = {
      pkgs = import inputs.nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
      unstablePkgs = import inputs.nixpkgs-unstable {
        inherit system;
        config.allowUnfree = true;
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
