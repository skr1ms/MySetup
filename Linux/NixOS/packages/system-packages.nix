{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # System utilities
    steam-run
    acpi
    powertop
    networkmanagerapplet
    libnotify
    
    # Core tools
    git
    kitty
    neovim
    fish
    bash
    curl
    wget
    bat
    procs
    antigravity
    
    # Hardware control
    brightnessctl
    ddcutil
    lm_sensors
    inotify-tools
    
    # Database clients
    sqlite
    
    # Container tools
    docker-compose
    podman-compose
    
    # File operations
    imagemagick
    file
    unzip
    zip
    rar
    trash-cli
    
    # CLI utilities
    tree
    jq
    ripgrep
    fd
    fzf
    eza
    
    # System monitoring
    btop
    htop
    glances
    
    # Torrent
    qbittorrent
  ];
}
