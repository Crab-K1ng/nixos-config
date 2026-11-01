{ self, inputs, ... }: {
  flake.nixosConfigurations.newHost = inputs.nixpkgs.lib.nixosSystem {
    modules = with self.nixosModules; [
      newHostConfiguration
      system
      desktop
      font
      fastfetch
      fish
      git
      lazygit
      brave
    ];
  };
}
