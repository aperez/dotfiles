# PLACEHOLDER so the config evaluates. Replace with the output of
# `nixos-generate-config --show-hardware-config` during install.
{
  fileSystems."/" = {
    device = "/dev/disk/by-label/nixos";
    fsType = "ext4";
  };
  fileSystems."/boot" = {
    device = "/dev/disk/by-label/boot";
    fsType = "vfat";
  };
  nixpkgs.hostPlatform = "x86_64-linux";
}
