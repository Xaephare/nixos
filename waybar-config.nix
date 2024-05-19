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
          "format" = "󰂯 {device_battery_percentage}%";
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

        "backlight/slider" = {
          "min" = 1;
        };
        
        "clock" = {
          "format" = "{:%H:%M}";
          "tooltip-format" = "<tt><small>{calendar}</small></tt>";
          "calendar" = {
            "mode" = "year";
            "mode-mon-col" = 3;
            "weeks-pos" = "right";
            "on-scroll" = 1;
            "format" = {
              "months" = "<span color='#ffead3'><b>{}</b></span>";
              "days" = "<span color='#ecc6d9'><b>{}</b></span>";
              "weeks" = "<span color='#99ffdd'><b>W{}</b></span>";
              "weekdays" = "<span color='#ffcc66'><b>{}</b></span>";
              "today" = "<span color='#ff6699'><b><u>{}</u></b></span>";
            };
          };
          "actions" = {
            "on-click-right" = "mode";
            "on-scroll-up" = "shift_up";
            "on-scroll-down" = "shift_down";
          };
        };
      };
    };
    style = "
      #backlight-slider slider {
        min-height: 5px;
        min-width: 5px;
        background-color: gray;
        background-image: none;
        border: none;
        box-shadow: none;
      }
      #backlight-slider trough {
        min-height: 3px;
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
