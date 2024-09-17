{
  lib,
  config,
  pkgs,
  ...
}:
with lib; let
  cfg = config.modules.hyprland;
in {
  options.modules.hyprland = {enable = mkEnableOption "hyprland";};
  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      hyprpaper
      hyprland
      wl-clipboard
      hyprland-protocols
      wlogout
    ];

    home.file.".config/hypr/wallpaper.png".source = ../../pics/wallpaper.png;
    home.file.".config/hypr/PwNixOS-Wallpaper.png".source = ../../pics/PwNixOS-Wallpaper.png;

    services.hypridle = {
      enable = true;
      settings = {
        general = {
          lock_cmd = "pidof hyprlock || hyprlock";
          before_sleep_cmd = "loginctl lock-session";
          after_sleep_cmd = "hyprctl dispatch dpms on";
        };
        listener = [
          {
            timeout = 600;
            on-timeout = "loginctl lock-session";
          }
          {
            timeout = 615;
            on-timeout = "hyprctl dispatch dpms off";
            on-resume = "hyprctl dispatch dpms on";
          }
          {
            timeout = 1800;
            on-timeout = "systemctl suspend";
          }
        ];
      };
    };

    services.hyprpaper = {
      enable = true;
      settings = {
        preload = [
          "~/.config/hypr/PwNixOS-Wallpaper.png"
        ];
        wallpaper = [
          ",~/.config/hypr/PwNixOS-Wallpaper.png"
        ];
        ipc = "on";
        splash = false;
      };
    };

    programs.hyprlock = {
      enable = true;
      settings = {
        general = {
          disable_loading_bar = true;
          grace = 1;
          hide_cursor = true;
          no_fade_in = false;
        };

        background = [
          {
            path = "~/.config/hypr/PwNixOS-Wallpaper.png";
            blur_passes = 3;
            blur_size = 8;
          }
        ];

        input-field = [
          {
            size = "200, 50";
            position = "0, -80";
            monitor = "";
            dots_center = true;
            fade_on_empty = false;
            font_color = "rgb(202, 211, 245)";
            inner_color = "rgb(91, 96, 120)";
            outer_color = "rgb(24, 25, 38)";
            outline_thickness = 5;
            placeholder_text = "<span foreground=\"##cad3f5\">Password...</span>";
            shadow_passes = 2;
          }
        ];
      };
    };

    wayland.windowManager.hyprland = {
      enable = true;
      systemd = {
        enable = true;
        enableXdgAutostart = true;
      };
      xwayland.enable = true;
      settings = {
        monitor = [
          "eDP-1,1920x1080@60,0x0,1"
          "eDP-1,addreserved,0,0,0,0"
          "HDMI-A-4,1920x1080@165,1920x0,1"
          "HDMI-A-4,addreserved,0,0,0,0"
          ",1920x1080@60,auto,1"
          ",addreserved,0,0,0,0"
        ];
        exec-once = [
          "dunst"
          "waybar"
          "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP GTK_THEME"
          "systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP GTK_THEME"
          "systemctl --user enable --now hypridle.service"
        ];
        misc = {
          disable_hyprland_logo = true;
          disable_splash_rendering = true;
        };
        input = {
          kb_layout = "us,es";
          follow_mouse = 1;
          kb_options = "grp:win_space_toggle"; # WIN + SPACE
          kb_variant = "intl,";
        };
        general = {
          sensitivity = 1;
          gaps_in = 6;
          gaps_out = 12;
          border_size = 4;
          "col.active_border" = "0xffb072d1";
          "col.inactive_border" = "0xff292a37";
        };
        decoration = {
          rounding = 8;
          blur = {
            enabled = true;
          };
          drop_shadow = 0;
          shadow_range = 60;
          "col.shadow" = "0x66000000";
        };
        animations = {
          enabled = 1;
          animation = [
            "windowsIn,1,4,default"
            "windowsMove,1,2,default"
            "windowsOut,1,4,default,slide"
            "border,1,5,default"
            "fade,1,5,default"
            "workspaces,0,1,default"
          ];
        };
        dwindle = {
          pseudotile = 0;
        };
        windowrule = [
          "float,move 0 0,pqiv"
          "float,foot-notes"
        ];
        bind = [
          # Basic binds
          "SUPER,Return,exec,kitty"
          "SUPER,Q,killactive,"
          "SUPER,V,togglefloating,"
          "SUPER,D,exec,fuzzel"
          "SUPERSHIFT,S,exec,grimblast copy area"
          "SUPER,F,fullscreen,0"
          "SUPER,X,exec,wlogout"
          "SUPER,L,exec,hyprlock"
          # Focus
          "SUPER,left,movefocus,l"
          "SUPER,right,movefocus,r"
          "SUPER,up,movefocus,u"
          "SUPER,down,movefocus,d"
          # Movemente
          "SUPERSHIFT,left,movewindow,l"
          "SUPERSHIFT,right,movewindow,r"
          "SUPERSHIFT,up,movewindow,u"
          "SUPERSHIFT,down,movewindow,d"
          # Resize
          "SUPERCTRL,right,resizeactive,10 0"
          "SUPERCTRL,left,resizeactive,-10 0"
          "SUPERCTRL,up,resizeactive,0 -10"
          "SUPERCTRL,down,resizeactive,0 10"
          # Change to Workspace
          "SUPER,1,workspace,1"
          "SUPER,2,workspace,2"
          "SUPER,3,workspace,3"
          "SUPER,4,workspace,4"
          "SUPER,5,workspace,5"
          "SUPER,6,workspace,6"
          "SUPER,7,workspace,7"
          "SUPER,8,workspace,8"
          "SUPER,9,workspace,9"
          "SUPER,0,workspace,0"
          # Move app to workspace
          "SUPERSHIFT,1,movetoworkspacesilent,1"
          "SUPERSHIFT,2,movetoworkspacesilent,2"
          "SUPERSHIFT,3,movetoworkspacesilent,3"
          "SUPERSHIFT,4,movetoworkspacesilent,4"
          "SUPERSHIFT,5,movetoworkspacesilent,5"
          "SUPERSHIFT,6,movetoworkspacesilent,6"
          "SUPERSHIFT,7,movetoworkspacesilent,7"
          "SUPERSHIFT,8,movetoworkspacesilent,8"
          "SUPERSHIFT,9,movetoworkspacesilent,9"
          "SUPERSHIFT,0,movetoworkspacesilent,0"
          ",XF86MonBrightnessUp,exec,brightnessctl set +5%"
          ",XF86MonBrightnessDown,exec,brightnessctl set 5%-"
          ",XF86AudioRaiseVolume,exec,amixer -D pipewire sset Master 5%+"
          ",XF86AudioLowerVolume,exec,amixer -D pipewire sset Master 5%-"
          ",XF86AudioMute,exec,amixer -D pipewire sset Master 1+ toggle"
        ];
        bindm = [
          "SUPER, mouse:272, movewindow"
          "SUPER, mouse:273, resizewindow"
        ];
      };
    };
  };
}
