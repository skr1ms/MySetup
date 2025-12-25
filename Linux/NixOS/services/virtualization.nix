{ ... }:

{
  virtualisation = {
    libvirtd.enable = true;
    vmware.host.enable = true;
    
    virtualbox.host = {
      enable = true;
      enableExtensionPack = true;
    };
    
    docker = {
      enable = true;
      daemon.settings = {
        dns = [ "8.8.8.8" "1.1.1.1" "77.88.8.8" ];
        log-driver = "journald";
      };
    };

    podman = {
      enable = true;
      dockerCompat = false;
      dockerSocket.enable = false;
      defaultNetwork.settings.dns_enabled = true;
    };
  };
}
