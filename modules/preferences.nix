# How I like things set up. Imported by both NixOS (hosts/common.nix) and
# home-manager (home/).
{ lib, pkgs, ... }:
{
  options.my = {
    xkbOptions = lib.mkOption {
      type = lib.types.str;
      readOnly = true;
      description = "XKB options, comma-separated.";
    };

    font = {
      name = lib.mkOption {
        type = lib.types.str;
        readOnly = true;
        description = "Monospace font family.";
      };
      package = lib.mkOption {
        type = lib.types.package;
        readOnly = true;
        description = "Package providing my.font.name.";
      };
      size = lib.mkOption {
        type = lib.types.int;
        description = "Font size, set per host in hosts/<host>/home.nix.";
      };
    };
  };

  config.my = {
    xkbOptions = "ctrl:nocaps";
    font = {
      name = "JetBrains Mono";
      package = pkgs.jetbrains-mono;
    };
  };
}
