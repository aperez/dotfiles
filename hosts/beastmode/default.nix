# Desktop: Ryzen 9 5900X, RTX 3080 Ti, 2x Samsung Odyssey G80SH
{ ... }:
{
  imports = [
    ../common.nix
    ./hardware.nix
  ];

  hardware.cpu.amd.updateMicrocode = true;

  # Nvidia (open kernel module, same as nvidia-open on Arch)
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia = {
    open = true;
    modesetting.enable = true;
    videoAcceleration = true;
  };
  programs.sway.extraOptions = [ "--unsupported-gpu" ];

  programs.steam.enable = true;

  home-manager.users.aperez = ./home.nix;
}
