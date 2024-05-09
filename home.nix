{
  config,
  pkgs,
  ...
}: {
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "xaephare";
  home.homeDirectory = "/home/xaephare";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.11"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. If you don't want to manage your shell through Home
  # Manager then you have to manually source 'hm-session-vars.sh' located at
  # either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/xaephare/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Program configs
  imports = [
    ./hyprland-config.nix
  ];

  programs.git = {
    enable = true;
    userName = "Xaephare";
    userEmail = "louisgrace@onmail.com";
  };

  programs.kitty = {
    enable = true;
    settings = {
      confirm_os_window_close = 0;
    };
    shellIntegration.enableFishIntegration = true;
  };

  programs.fish = {
    enable = true;
    functions = {
      fish_greeting = "";
    };
  };

  programs.vscode = {
    enable = true;
    package = pkgs.vscodium-fhs;
  };

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
  };
}
