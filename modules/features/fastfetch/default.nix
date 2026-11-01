{
  inputs,
  lib,
  moduleWithSystem,
  ...
}:
let
  # header config :)
  headerLength = 62;
  headerPadText = "─";
  headerColor = "cyan";
  header =
    text:
    let
      textlen = builtins.stringLength text + 2; # for the spaces
      pad = headerLength - textlen;
      left = pad / 2;
      right = pad - left;
      padText = len: lib.strings.replicate len headerPadText;
    in
    "${padText left} {#${headerColor}}${text}{#} ${padText right}";
in
{
  flake.nixosModules.fastfetch = moduleWithSystem (
    { self', ... }: {
      environment.systemPackages = [ self'.packages.fastfetch ];
    }
  );

  perSystem = { pkgs, ... }: {
    packages.fastfetch = inputs.wrappers.wrappers.fastfetch.wrap {
      inherit pkgs;
      settings = {
        #display settings
        display = {
          separator = ": ";
          hideCursor = true;
          brightColor = true;
          color = {
            title = "red";
            keys = "magenta";
          };
          key = {
            type = "both";
          };
        };

        modules = [
          "title"
          "uptime"
          {
            "type" = "custom";
            "format" = header "OS";
          }
          "os"
          "host"
          "kernel"
          "packages"
          {
            "type" = "custom";
            "format" = header "DE";
          }
          "de"
          "wm"
          "wmtheme"
          "theme"
          "icons"
          "font"
          "cursor"
          {
            "type" = "custom";
            "format" = header "Terminal";
          }
          "shell"
          "terminal"
          "terminalfont"
          {
            "type" = "custom";
            "format" = header "Hardware";
          }
          "cpu"
          "gpu"
          "memory"
          "swap"
          "display"
          "disk"
          "battery"
          {
            "type" = "custom";
            "format" = "──────────────────────────────────────────────────────────────";
          }
          "localip"
          "locale"
        ];
      };
    };
  };
}
