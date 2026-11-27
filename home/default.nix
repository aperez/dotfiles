# User environment shared by every host. Host-specific bits live in
# ../hosts/<host>/home.nix.
{ pkgs, ... }:
{
  imports = [
    ./shell.nix
    ./sway
    ./emacs
  ];

  home.packages = with pkgs; [
    claude-code
    curl
    jetbrains-mono
    nixfmt
    npins
    noto-fonts-cjk-sans
    pavucontrol
    spotify
  ];

  fonts.fontconfig = {
    enable = true;
    defaultFonts.monospace = [ "JetBrains Mono" ];
  };

  gtk = {
    enable = true;
    colorScheme = "dark";
    iconTheme = {
      package = pkgs.adwaita-icon-theme;
      name = "Adwaita";
    };
  };

  home.pointerCursor = {
    enable = true;
    package = pkgs.adwaita-icon-theme;
    name = "Adwaita";
    size = 24;
    gtk.enable = true;
    sway.enable = true;
  };

  programs.git = {
    enable = true;
    settings = {
      user.name = "Alexandre Perez";
      user.email = "alexandrecperez@gmail.com";
      init.defaultBranch = "main";
    };
  };

  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
    settings."*".AddKeysToAgent = "yes";
  };
  services.ssh-agent.enable = true;

  programs.gpg.enable = true;
  services.gpg-agent = {
    enable = true;
    pinentry.package = pkgs.pinentry-gnome3; # needs gcr, see hosts/common.nix
  };
  programs.password-store.enable = true;

  programs.ghostty = {
    enable = true;
    settings = {
      theme = "0x96f";
      font-family = "JetBrains Mono";
      font-size = 15;
      font-feature = [
        "-calt"
        "-liga"
        "-dlig"
      ];
      # Tiling WM: no client-side title bar
      window-decoration = "none";
    };
  };

  programs.firefox = {
    enable = true;
    profiles.default.settings = {
      "extensions.activeThemeID" = "firefox-compact-dark@mozilla.org";
      "browser.newtabpage.enabled" = false;
      "browser.startup.homepage" = "about:blank";
    };
  };

  programs.neovim = {
    enable = true;
    vimAlias = true;
  };

  # Set once at install time; do not bump on upgrades.
  home.stateVersion = "26.11";
}
