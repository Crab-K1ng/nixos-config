{ ... }: {
  flake.nixosModules.user = { ... }: {
    users.users.user01 = {
      isNormalUser = true;
      initialPassword = "test";
      extraGroups = [
        "root"
        "wheel"
      ];
    };
  };
}
