{ pkgs, ... }:

{
  services.dbus.enable = true;
  services.gvfs.enable = true; 
  services.tumbler.enable = true;
  
  systemd.user.services.nm-applet = {
    description = "NetworkManager Applet";
    wantedBy = [ "graphical-session.target" ];
    partOf = [ "graphical-session.target" ];
    serviceConfig = {
      ExecStart = "${pkgs.networkmanagerapplet}/bin/nm-applet --indicator";
      Restart = "on-failure";
    };
  };
}
