{ lib, ... }:
{
  options.my.fontSize = lib.mkOption {
    type = lib.types.int;
    description = "Font size, set per host.";
  };

  options.my.dotfiles = lib.mkOption {
    type = lib.types.str;
    readOnly = true;
    # Absolute path of the checkout being built. nixos-install builds from
    # /mnt, which is / after the reboot, so drop that prefix.
    default = lib.removePrefix "/mnt" (toString ../.);
    description = "Path of this dotfiles checkout on the running system.";
  };
}
