{
  my.font.size = 15;

  programs.firefox.profiles.default.settings = {
    "layout.css.devPixelsPerPx" = "1.25";
    # Hardware video decoding through nvidia-vaapi-driver.
    "media.ffmpeg.vaapi.enabled" = true;
    "media.hardware-video-decoding.force-enabled" = true;
  };

  home.sessionVariables = {
    LIBVA_DRIVER_NAME = "nvidia";
    NVD_BACKEND = "direct";
    # The RDD sandbox blocks the driver's access to /dev/nvidia*.
    MOZ_DISABLE_RDD_SANDBOX = "1";
  };

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
