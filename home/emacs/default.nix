{
  config,
  host,
  pkgs,
  ...
}:
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

  xdg.configFile."emacs/early-init.el".source =
    config.lib.file.mkOutOfStoreSymlink "${config.my.dotfiles}/home/emacs/early-init.el";
  xdg.configFile."emacs/init.el".source =
    config.lib.file.mkOutOfStoreSymlink "${config.my.dotfiles}/home/emacs/init.el";

  xdg.configFile."emacs/${host}-early.el".text = ''
    ;;; -*- lexical-binding: t -*-

    (push '(font . "JetBrains Mono-${toString config.my.fontSize}") default-frame-alist)
  '';
}
