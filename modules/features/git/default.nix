{ inputs, moduleWithSystem, ... }: {
  flake.nixosModules.git = moduleWithSystem (
    { self', ... }: {
      programs.git = {
        enable = true;
        package = self'.packages.git;
      };
    }
  );

  perSystem = { pkgs, ... }: {
    packages.git = inputs.wrappers.wrappers.git.wrap {
      inherit pkgs;
      setting = {
        user = {
          name = "CrabKing";
          email = "127689590+Crab-K1ng@users.noreply.github.com";
        };

        init.defaultBranch = "main";
      };
    };
  };
}
