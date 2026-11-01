{ inputs, moduleWithSystem, ... }: {
  flake.nixosModules.brave = moduleWithSystem (
    { self', ... }:
    let
      darkReaderExt = "eimadpbcbfnmbkopoojfekhnkhdbieeh"; # Dark Reader
      protonPassExt = "ghmbeldphafepmbegfdlkpapadhbakde"; # Proton Pass
    in
    {

      environment.systemPackages = [
        self'.packages.brave
      ];

      programs.chromium = {
        enable = true;
        enablePlasmaBrowserIntegration = true;

        extensions = [
          darkReaderExt
          protonPassExt
        ];

        # took this from https://github.com/flyingPenguinW/brave-origin
        extraOpts = {

          # stuff i want
          TranslateEnabled = true;
          "SpellcheckEnabled" = true;
          "SpellcheckLanguage" = [ "en-GB" ];

          # enable memory saver
          HighEfficiencyModeEnabled = true;
          MemorySaverModeSavings = 1; # Balanced

          # UI
          BookmarkBarEnabled = false;

          # Make brave like brave origin without having to press the button for it
          BraveRewardsDisabled = true;
          BraveWalletDisabled = true;
          BraveVPNDisabled = true;
          BraveNewsDisabled = true;
          BraveTalkDisabled = true;

          BraveAIChatEnabled = false;
          BravePlaylistEnabled = false;

          # Features
          PasswordManagerEnabled = false;
          AutofillCreditCardEnabled = false;

          # Telemetry
          SyncDisabled = true;

          BraveP3AEnabled = false;
          BraveStatsPingEnabled = false;
          BraveWebDiscoveryEnabled = false;
          BackgroundModeEnabled = false;
          MetricsReportingEnabled = false;

          ExtensionSettings = {
            "${darkReaderExt}" = {
              toolbar_pin = "default_pinned";
            };
            "${protonPassExt}" = {
              toolbar_pin = "default_pinned";
            };
          };

        };
      };
    }
  );

  perSystem = { unstablePkgs, ... }: {
    packages.brave = inputs.wrappers.lib.wrapPackage {
      pkgs = unstablePkgs;
      package = unstablePkgs.brave;
      flags = {
        "--force-dark-mode" = true;
      };
    };
  };
}
