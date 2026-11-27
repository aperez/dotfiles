# Sway itself is installed by programs.sway in hosts/common.nix; this only
# writes its config. Keybindings are sway's defaults plus the changes below.
{ lib, pkgs, ... }:
let
  mod = "Mod4";
  wpctl = "${pkgs.wireplumber}/bin/wpctl";
  grim = lib.getExe pkgs.grim;
  slurp = lib.getExe pkgs.slurp;
  wl-copy = "${pkgs.wl-clipboard}/bin/wl-copy";
in
{
  home.packages = [
    pkgs.grim
    pkgs.slurp
    pkgs.wl-clipboard
    pkgs.wmenu
  ];

  programs.swaylock = {
    enable = true;
    settings.color = "323232";
  };

  wayland.windowManager.sway = {
    enable = true;
    package = null;
    checkConfig = false; # needs a sway package to check against

    config = {
      modifier = mod;
      terminal = "ghostty";
      menu = "wmenu-run";
      defaultWorkspace = "workspace number 1";
      fonts = {
        names = [ "JetBrains Mono" ];
        size = 11.0;
      };

      input."*".xkb_options = "ctrl:nocaps";

      # mkOptionDefault keeps sway's default bindings and layers these on top.
      keybindings = lib.mkOptionDefault {
        "${mod}+h" = "splith";
        "${mod}+b" = "exec firefox";
        "${mod}+m" = "exec emacsclient --create-frame --alternate-editor=''";
        "${mod}+p" = "exec spotify";
        "${mod}+Escape" = "exec swaylock -f";
        # Default uses -b, which runs `swaymsg exit` inside a terminal.
        "${mod}+Shift+e" =
          "exec swaynag -t warning -m 'Exit sway? This ends your Wayland session.' -B 'Yes, exit sway' 'swaymsg exit'";

        "${mod}+minus" = "workspace back_and_forth";
        "${mod}+equal" = "workspace back_and_forth";
        "${mod}+grave" = "workspace back_and_forth";

        # Arrow keys only: drop the default vim-style hjkl focus/move keys.
        "${mod}+j" = null;
        "${mod}+k" = null;
        "${mod}+l" = null;
        "${mod}+Shift+h" = null;
        "${mod}+Shift+j" = null;
        "${mod}+Shift+k" = null;
        "${mod}+Shift+l" = null;
        # $mod+minus no longer shows the scratchpad, so don't send windows there.
        "${mod}+Shift+minus" = null;

        "--locked XF86AudioMute" = "exec ${wpctl} set-mute @DEFAULT_AUDIO_SINK@ toggle";
        "--locked XF86AudioLowerVolume" = "exec ${wpctl} set-volume @DEFAULT_AUDIO_SINK@ 5%-";
        "--locked XF86AudioRaiseVolume" = "exec ${wpctl} set-volume @DEFAULT_AUDIO_SINK@ 5%+";
        "--locked XF86AudioMicMute" = "exec ${wpctl} set-mute @DEFAULT_AUDIO_SOURCE@ toggle";

        "Print" = "exec ${grim}";
        "Shift+Print" = "exec ${grim} -g \"$(${slurp})\" - | ${wl-copy}";
      };

      bars = [
        {
          position = "bottom";
          statusCommand = "${pkgs.writeShellScript "sway-bar" (builtins.readFile ./bar.sh)}";
          fonts = {
            names = [ "JetBrains Mono" ];
            size = 12.0;
          };
          colors = {
            statusline = "#ffffff";
            background = "#323232";
            inactiveWorkspace = {
              border = "#32323200";
              background = "#32323200";
              text = "#5c5c5c";
            };
          };
        }
      ];
    };
  };
}
