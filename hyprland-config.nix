{ lib, config, pkgs, ... }:

let
  hyprland = wayland.windowManager.hyprland;
in {
  hyprland.enable = true;

  hyprland.settings = {
    monitor = [
      "eDP-1, 1920x1080@60, 0x0, 1"
      ",preferred,auto,1" # for random monitors
    ];

    exec-once = [
      "lxsession"
      "systemctl --user start graphical-session.target"
      "exec waybar"
    ];

    env = [
      "XCURSOR_SIZE, 24"
    ];

    input = {
      kb_layout = "us";
      kb_variant = "";
      kb_model = "";
      kb_options = "";
      kb_rules = "";

      follow_mouse = 1;

      touchpad = {
        natural_scroll = true;
      };

      sensitivity = 0;
    };

    general = {
      gaps_in = 3;
      gaps_out = 5;
      border_size = 2;
      "col.active_border" = "rgba(e759ffee) rgba(5a70ffee) 45deg";
      "col.inactive_border" = "rgba(595959aa)";

      layout = "dwindle";

      allow_tearing = false;
    };

    decoration = {
      rounding = 3;

      blur = {
        enabled = true;
        size = 3;
        quality = 5;
        passes = 1;
      };

      drop_shadow = yes;
      shadow_range = 4;
      shadow_render_power = 3;
      "col.shadow" = "rgba(1a1a1aee)";
    };

    animations = {
      enabled = yes;
      bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";
      animation = [
        "windows, 1, 7, myBezier"
        "windowsOut, 1, 7, default, popin 80%"
        "border, 1, 10, default"
        "borderangle, 1, 8, default"
        "fade, 1, 7, default"
        "workspaces, 1, 6, default"
      ];
    };

    dwindle = {
      pseudotiles = yes;
      preserve_split = yes;
    };

    master = {
      new_is_master = true;
    };

    gestures = {
      workspace_swipe = true;
      workspace_swipe_fingers = 3;
    };

    misc = {
      force_default_wallpaper = "-1";
    };

    # Macros
    "$mainMod" = "SUPER";

    bind = [
      "$mainMod, Q, exec, kitty"
      "$mainMod, C, killactive, "
      "$mainMod, M, exit,"
      "$mainMod, E, exec, thunar"
      "$mainMod, K, exec, hyprshot --mode window"
      "$mainMod, H, exec, hyprshot --mode region"
      "$mainMod, V, togglefloating,"
      "$mainMod, P, pseudo,"
      "$mainMod, J, togglesplit,"

      # Move focus
      "$mainMod, left, movefocus, l"
      "$mainMod, right, movefocus, "r
      "$mainMod, up, movefocus, u"
      "$mainMod, down, movefocus, d"

      # Switch workspaces with mainMod
      "$mainMod, 1, workspace, 1"
      "$mainMod, 2, workspace, 2"
      "$mainMod, 3, workspace, 3"
      "$mainMod, 4, workspace, 4"
      "$mainMod, 5, workspace, 5"
      "$mainMod, 6, workspace, 6"
      "$mainMod, 7, workspace, 7"
      "$mainMod, 8, workspace, 8"
      "$mainMod, 9, workspace, 9"
      "$mainMod, 0, workspace, 10"

      # Move active window to a workspace
      "$mainMod SHIFT, 1, movetoworkspace, 1"
      "$mainMod SHIFT, 2, movetoworkspace, 2"
      "$mainMod SHIFT, 3, movetoworkspace, 3"
      "$mainMod SHIFT, 4, movetoworkspace, 4"
      "$mainMod SHIFT, 5, movetoworkspace, 5"
      "$mainMod SHIFT, 6, movetoworkspace, 6"
      "$mainMod SHIFT, 7, movetoworkspace, 7"
      "$mainMod SHIFT, 8, movetoworkspace, 8"
      "$mainMod SHIFT, 9, movetoworkspace, 9"
      "$mainMod SHIFT, 0, movetoworkspace, 10"

      # Example special workspace (scratchpad)
      "$mainMod, S, togglespecialworkspace, magic"
      "$mainMod SHIFT, S, movetoworkspace, special:magic"

      # Scroll through existing workspaces
      "$mainMod, mouse_down, workspace, e+1"
      "$mainMod, mouse_up, workspace, e-1"

      # Application manager
      "$mainMod, F, exec, rofi -show drun"

      # Screen brightness
      " , XF86MonBrightnessUp, exec, brightnessctl s +5%"
      " , XF86MonBrightnessDown, exec, brightnessctl s 5%-"

      # Volume and Media Control
      " , XF86AudioRaiseVolume, exec, pamixer -i 5 "
      " , XF86AudioLowerVolume, exec, pamixer -d 5 "
      " , XF86AudioMicMute, exec, pamixer --default-source -m"
      " , XF86AudioMute, exec, pamixer -t"
      " , XF86AudioPlay, exec, playerctl play-pause"
      " , XF86AudioPause, exec, playerctl play-pause"
      " , XF86AudioNext, exec, playerctl next"
      " , XF86AudioPrev, exec, playerctl previous"
    ];

    bindm = [
      # Move/resize windows LMB/RMB
      "bindm = $mainMod, mouse:272, movewindow"
      "bindm = $mainMod, mouse:273, resizewindow"
    ];
  }
}