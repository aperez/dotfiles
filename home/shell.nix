{ ... }:
let
  fd = "fd --hidden --follow";
in
{
  programs.fish = {
    enable = true;
    interactiveShellInit = "set fish_greeting";
    # TTY login: start sway on tty1 only, other TTYs stay plain shells.
    loginShellInit = ''
      if test -z "$WAYLAND_DISPLAY"; and test (tty) = /dev/tty1
          exec sway
      end
    '';
    shellAliases = {
      cat = "bat";
      ls = "eza --group-directories-first";
      ll = "eza --group-directories-first --long --git --all --header";
      tree = "eza --tree";
    };
    shellAbbrs.rebuild = "sudo nixos-rebuild switch --file ${toString ../.} --attr (hostname)";
  };

  home.sessionVariables = {
    EDITOR = "emacsclient -t -a nvim";
    VISUAL = "emacsclient -t -a nvim";
  };

  programs.bat.enable = true;
  programs.eza.enable = true;
  programs.ripgrep.enable = true;
  programs.htop.enable = true;
  programs.zoxide.enable = true;

  programs.fd = {
    enable = true;
    ignores = [
      ".git/"
      ".cache/"
      ".mozilla/"
      ".steam/"
    ];
  };

  programs.fzf = {
    enable = true;
    defaultCommand = fd;
    fileWidget.command = "${fd} --type=f";
    fileWidget.options = [ "--preview='bat --style=numbers --color=always {}'" ];
    changeDirWidget.command = "${fd} --type=d";
    changeDirWidget.options = [ "--preview='eza --tree --all --color=always --git-ignore {}'" ];
  };

  # Per-project environments: `use nix` in a .envrc loads ./shell.nix on cd.
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };
}
