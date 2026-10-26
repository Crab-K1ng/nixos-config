{ self, inputs, ... }: {
  flake.nixosConfigurations.newHost = inputs.nixpkgs.lib.nixosSystem {
    modules = with self.nixosModules; [
      newHostConfiguration
      system
      fastfetch
    ];
  };
}
