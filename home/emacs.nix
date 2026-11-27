# Blank slate: Emacs with no config yet. Packages will come from Nix
# (prebuilt and native-compiled) rather than ELPA/MELPA at startup.
{ pkgs, ... }:
{
  programs.emacs = {
    enable = true;
    package = pkgs.emacs-pgtk;
  };

  services.emacs = {
    enable = true;
    startWithUserSession = "graphical";
  };
}
