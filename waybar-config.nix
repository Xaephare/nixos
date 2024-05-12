{
  programs.waybar = {
    enable = true;
    systemd.enable = true;
    systemd.target = "multi-user.target";

    settings = {
      mainBar = {
        "layer" = "top";
        "modules-left" = ["hyprland/workspaces" "mpd" "hyprland/mode"];
        "modules-center" = [];
        "modules-right" = ["battery" "network" "pulseaudio" "temperature" "cpu" "memory" "clock"];
        "mpd" = {
          "tooltip" = false;
          "format" = "{stateIcon} {artist} - {album} - {title} ({elapsedTime:%M:%S}/{totalTime:%M:%S})";
          "format-disconnected" = "ﳌ";
          "format-stopped" = "";
          "state-icons" = {
            "playing" = "";
            "paused" = "";
          };
        };
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
        "pulseaudio" = {
          "tooltip" = false;
          "scroll-step" = 5;
          "format" = "{icon}  {volume}%";
          "format-icons" = {
            "default" = ["" ""];
          };
        };
        "network" = {
          "tooltip" = false;
          "format-wifi" = "  {essid} {ipaddr}";
          "format-ethernet" = "󰈀  {ipaddr}";
        };
        "cpu" = {
          "tooltip" = false;
          "format" = "  {}%";
        };
        "memory" = {
          "tooltip" = false;
          "format" = "  {}%";
        };
        "temperature" = {
          "tooltip" = false;
          "format" = " {}°C";
        };
      };
    };
    style = "
      #workspaces button {
        padding: 0 0.5em;
        background-color: @surface0;
        color: @text;
        margin: 0.25em;
      }
      #workspaces button.empty {
        color: #F8F8FF; /*white*/
      }
      #workspaces button.visible {
        color: #ffffff; /*white*/
      }
      #workspaces button.active {
        color: #00FFFF; /*cyan*/
      }
      #workspaces button.urgent {
        background-color: #DC143C; /*red*/
        border-radius: 1em;
        color: @text;
      }
    ";
  };
}
