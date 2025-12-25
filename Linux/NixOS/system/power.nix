{ pkgs, ... }:

{
  services.upower = {
    enable = true;
    criticalPowerAction = "Hibernate";
  };
  
  services.power-profiles-daemon.enable = true;
  
  hardware.acpilight.enable = true;

  services.udev.extraRules = ''
    ACTION=="add", SUBSYSTEM=="backlight", RUN+="${pkgs.coreutils}/bin/chgrp video /sys/class/backlight/%k/brightness"
    ACTION=="add", SUBSYSTEM=="backlight", RUN+="${pkgs.coreutils}/bin/chmod g+w /sys/class/backlight/%k/brightness"
  '';
}
