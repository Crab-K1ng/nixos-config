nix build .#nixosConfigurations.host.config.system.build.vm && ./result/bin/run-nixos-vm 


nix build --profile /nix/var/nix/profiles/system \
      │   ~/my-configurations#nixosConfigurations.machine.config.system.build.toplevel