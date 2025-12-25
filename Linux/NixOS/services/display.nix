{ pkgs, ... }:

let
  sddmAstronaut = pkgs.sddm-astronaut.override {
    embeddedTheme = "pixel_sakura";
  };
in
{
  services.xserver.enable = false;

  services.displayManager = {
    sddm = {
      enable = true;
      wayland.enable = true;
      package = pkgs.kdePackages.sddm;
      theme = "sddm-astronaut-theme";

      settings = {
        Theme = {
          ThemeDir = "${sddmAstronaut}/share/sddm/themes";
          Current = "sddm-astronaut-theme";
        };
      };

      extraPackages = with pkgs; [
        sddmAstronaut
        qt6.qtsvg
        qt6.qtmultimedia
        qt6.qt5compat
        kdePackages.kirigami-addons
        kdePackages.qqc2-desktop-style
      ];
    };
    
    defaultSession = "hyprland";
  };

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };
}
