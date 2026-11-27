# Shared by every host. Keep this to things that need root or system
# integration; everything else belongs in ../home.
{ pkgs, ... }:
let
  sources = import ../npins;
in
{
  imports = [ "${sources.home-manager}/nixos" ];

  # Boot
  boot.loader.systemd-boot.enable = true;
  boot.loader.systemd-boot.configurationLimit = 10;
  boot.loader.efi.canTouchEfiVariables = true;
  zramSwap.enable = true;

  # Nix: no channels, <nixpkgs> is the same pinned nixpkgs the system uses.
  nix.channel.enable = false;
  nix.nixPath = [ "nixpkgs=${sources.nixpkgs}" ];
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 14d";
  };
  nix.optimise.automatic = true;
  nixpkgs.config.allowUnfree = true;

  # Locale and keyboard (ctrl:nocaps on the TTY too)
  time.timeZone = "America/Los_Angeles";
  i18n.defaultLocale = "en_US.UTF-8";
  services.xserver.xkb.options = "ctrl:nocaps";
  console.useXkbConfig = true;

  # User
  users.users.aperez = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    shell = pkgs.fish;
  };
  programs.fish.enable = true;

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.aperez = ../home;
  };

  # Desktop: sway is enabled here (portals, polkit, PAM for swaylock,
  # graphics) but configured in home-manager.
  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
    extraPackages = [ ];
  };

  # Audio
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    pulse.enable = true;
    alsa.enable = true;
  };

  # Prompt service used by pinentry-gnome3
  services.dbus.packages = [ pkgs.gcr_3 ];

  fonts.enableDefaultPackages = true;

  # Run prebuilt binaries (uv's Python, rustup toolchains, ...)
  programs.nix-ld.enable = true;

  services.fwupd.enable = true;

  # Set once at install time; do not bump on upgrades.
  system.stateVersion = "26.11";
}
