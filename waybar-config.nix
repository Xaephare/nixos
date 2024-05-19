{
  programs.waybar = {
    enable = true;
    systemd.enable = true;
    systemd.target = "multi-user.target";

    settings = {
      mainBar = {
        "layer" = "top";
        "modules-left" = ["hyprland/workspaces"];
        "modules-center" = ["hyprland/window"];
        "modules-right" = [
          "backlight/slider"
          "battery"
          "bluetooth"
          "network"
          "pulseaudio"
          "temperature"
          "cpu"
          "memory"
          "clock"
        ];

        "hyprland/workspaces" = {
          "format" = "{icon}";
          "format-icons" = {
            "1" = "一";
            "2" = "二";
            "3" = "三";
            "4" = "四";
            "5" = "五";
            "6" = "六";
            "7" = "七";
            "8" = "八";
            "9" = "九";
            "10" = "〇";
          };
          "persistent-workspaces" = {
            "*" = 5;
            "eDP-1" = [1 2 3 4 5];
          };
        };
        "battery" = {
          "tooltip" = false;
          "format" = "{icon}  {capacity}%";
          "format-icons" = {
            "default" = ["" "" "" "" ""];
          };
        };
        "bluetooth" = {
          "on-click" = "blueman-manager";
          "format" = "{} {device_battery_percentage}";
        };
        "network" = {
          "tooltip" = false;
          "format-wifi" = "  {essid} {ipaddr}";
          "format-ethernet" = "󰈀  {ipaddr}";
        };
        "pulseaudio" = {
          "tooltip" = false;
          "scroll-step" = 5;
          "format" = "{icon}  {volume}%";
          "format-icons" = {
            "default" = ["" ""];
          };
        };
        "cpu" = {
          "tooltip" = false;
          "format" = "  {usage}%";
        };
        "memory" = {
          "tooltip" = false;
          "format" = "  {used}/{total}GB";
        };
        "temperature" = {
          "tooltip" = false;
          "format" = " {temperatureC}°C";
        };
        "clock" = {
          "format" = "{:%H:%M}";
        };
        "backlight/slider" = {
          "min" = 1;
        };
      };
    };
    style = "
      #backlight-slider slider {
        min-height: 10px;
        min-width: 10px;
        background-image: none;
        border: none;
        box-shadow: none;
      }
      #backlight-slider trough {
        min-height: 5px;
        min-width: 80px;
        border-radius: 5px;
        background-color: black;
      }
      #backlight-slider highlight {
        min-width: 10px;
        border-radius: 5px;
        background-color: cyan;
      }
      #workspaces button {
        padding: 0 0.5em;
        background-color: @surface0;
        color: @text;
        margin: 0.25em;
      }
      #workspaces button.empty {
        color: gray;
      }
      #workspaces button.visible {
        color: white;
      }
      #workspaces button.active {
        color: cyan;
      }
      #workspaces button.urgent {
        background-color: #DC143C; /*red*/
        border-radius: 1em;
        color: @text;
      }
    ";
  };
}
