{ ... }:

{
  programs.gpu-screen-recorder.enable = true;
  
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; 
    dedicatedServer.openFirewall = true; 
    localNetworkGameTransfers.openFirewall = true;
    gamescopeSession.enable = true;
  };
  
  programs.gamemode.enable = true;
}
