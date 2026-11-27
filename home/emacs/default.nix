{ config, pkgs, ... }:
{
  programs.emacs = {
    enable = true;
    package = pkgs.emacs-pgtk;
    extraPackages = epkgs: [
      epkgs.base16-theme
      epkgs.envrc
      epkgs.nix-mode
    ];
  };

  services.emacs = {
    enable = true;
    startWithUserSession = "graphical";
  };

  xdg.configFile."emacs/early-init.el".source = config.lib.file.mkOutOfStoreSymlink (
    toString ./early-init.el
  );
  xdg.configFile."emacs/init.el".source = config.lib.file.mkOutOfStoreSymlink (toString ./init.el);
}
