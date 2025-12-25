{ config, pkgs, inputs, system, ... }:

let
  quickshellPkg = inputs.quickshell.packages.${system}.default;
in
{
  programs.caelestia = {
    enable = true;

    systemd = {
      enable = false;
    };

    cli = {
      enable = true;
      settings.theme.enableGtk = false;
    };

    settings = {
      paths.wallpaperDir = "~/Pictures/Wallpapers";

      general.apps = {
        terminal = [ "foot" ];
        audio    = [ "pavucontrol" ];
        playback = [ "mpv" ];
        explorer = [ "thunar" ];
      };

      general.battery = {
        warnLevels = [
          {
            level = 20;
            title = "Low battery";
            message = "You might want to plug in a charger";
            icon = "battery_android_frame_2";
          }
          {
            level = 10;
            title = "Did you see the previous message?";
            message = "You should probably plug in a charger <b>now</b>";
            icon = "battery_android_frame_1";
          }
          {
            level = 5;
            title = "Critical battery level";
            message = "PLUG THE CHARGER RIGHT NOW!!";
            icon = "battery_android_alert";
            critical = true;
          }
        ];
        criticalLevel = 3;
      };

      bar = {
        persistent = true;

        entries = [
          { id = "logo";         enabled = true; }
          { id = "workspaces";   enabled = true; }
          { id = "spacer";       enabled = true; }
          { id = "activeWindow"; enabled = true; }
          { id = "spacer";       enabled = true; }
          { id = "tray";         enabled = true; }
          { id = "clock";        enabled = true; }
          { id = "statusIcons";  enabled = true; }
          { id = "power";        enabled = true; }
        ];

        workspaces = {
          activeIndicator = true;
          activeTrail = false;
          occupiedBg = false;
          perMonitorWorkspaces = true;
          showWindows = true;
          shown = 5;
        };

        status = {
          showAudio = false;
          showBattery = true;
          showBluetooth = true;
          showKbLayout = false;
          showMicrophone = false;
          showNetwork = true;
          showLockStatus = true;
        };

        scrollActions = {
          brightness = true;
          workspaces = true;
          volume = true;
        };
      };

      osd = {
        enabled = true;
        enableBrightness = true;
        enableMicrophone = false;
        hideDelay = 2000;
      };

      appearance.font.family = {
        clock    = "JetBrains Mono";
        material = "Material Symbols Rounded";
        mono     = "JetBrainsMono Nerd Font";
        sans     = "JetBrains Mono";
      };

      session = {
        enabled = true;
        dragThreshold = 30;
        vimKeybinds = false;
        commands = {
          logout   = [ "pkill" "-KILL" "-u" "takuya" ];
          shutdown = [ "systemctl" "poweroff" ];
          suspend  = [ "systemctl" "suspend" ];
          reboot   = [ "systemctl" "reboot" ];
        };
      };
    };
  };

  home.packages = [ quickshellPkg ];
}
