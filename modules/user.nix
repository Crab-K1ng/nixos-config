{ ... }: {
  flake.nixosModules.user = { ... }: {
    users.users.user = {
      isNormalUser = true;
      initialPassword = "password";
      extraGroups = [
        "root"
        "wheel"
      ];
    };
  };
}
