{
  my.fontSize = 15;

  programs.firefox.profiles.default.settings."layout.css.devPixelsPerPx" = "1.25";

  wayland.windowManager.sway = {
    config.output = {
      DP-2 = {
        mode = "3840x2160@244.000Hz";
        pos = "0 0";
      };
      DP-1 = {
        mode = "3840x2160@244.000Hz";
        pos = "3840 0";
      };
    };
    extraConfig = "focus output DP-2";
  };
}
