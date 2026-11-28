{
  config,
  lib,
  pkgs,
  ...
}:
let
  brightnessctl = lib.getExe pkgs.brightnessctl;
in
{
  my.font.size = 14;

  # Lock before suspend (e.g. closing the lid). No idle timeouts.
  services.swayidle = {
    enable = true;
    events.before-sleep = "${lib.getExe config.programs.swaylock.package} -f";
  };

  wayland.windowManager.sway.config.keybindings = lib.mkOptionDefault {
    "--locked XF86MonBrightnessDown" = "exec ${brightnessctl} set 5%-";
    "--locked XF86MonBrightnessUp" = "exec ${brightnessctl} set 5%+";
  };
}
