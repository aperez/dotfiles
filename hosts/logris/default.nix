# Laptop: ThinkPad X1 Carbon 5th gen (Kaby Lake, Intel graphics)
{ ... }:
let
  hw = (import ../../npins).nixos-hardware;
in
{
  imports = [
    ../common.nix
    ./hardware.nix
    # nixos-hardware has no 5th-gen profile; this is the 6th-gen one minus
    # its Elan TrackPoint override (the 5th gen has the classic TrackPoint).
    "${hw}/lenovo/thinkpad/x1"
    "${hw}/common/cpu/intel/kaby-lake"
    "${hw}/common/pc/ssd"
  ];

  networking.networkmanager.enable = true;
  users.users.aperez.extraGroups = [ "networkmanager" ];

  services.power-profiles-daemon.enable = true;

  home-manager.users.aperez = ./home.nix;
}
