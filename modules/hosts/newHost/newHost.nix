{ self, inputs, ... }: {
  flake.nixosConfigurations.host = inputs.nixpkgs.lib.nixosSystem {
    modules = with self.nixosModules; [
      hostConfiguration
      system
    ];
  };
}
