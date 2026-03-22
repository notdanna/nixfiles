{ pkgs, ... }: {
  home.username = "dam";
  home.homeDirectory = if pkgs.stdenv.isDarwin then "/Users/dam" else "/home/dam";
  
  home.stateVersion = "24.11";

  imports = [
    ./modules/common/zsh.nix
    ./modules/common/git.nix
    ./modules/common/packages.nix
  ];

  programs.home-manager.enable = true; #

  programs.waybar = {
  enable = true;
  settings = {
    mainBar = {
      layer = "top";
      position = "top";
      height = 36;
      modules-left = [ "niri/window" ];
      modules-center = [ "niri/workspaces" ];
      modules-right = [ "pulseaudio" "battery" "clock" ];

      "niri/workspaces" = {
        format = "{name}";
      };

      "battery" = {
        format = "{capacity}% {power:0.1f}W";
        interval = 2;
      };

      "clock" = {
        format = "{:%H:%M}";
      };
    };
  };
  style = ''
    window#waybar {
        background: rgba(26, 20, 35, 0.85);
        border-bottom: 2px solid #b084f4;
        color: #e0def4;
        font-family: "JetBrainsMono Nerd Font";
    }

    #workspaces button {
        padding: 0 5px;
        color: #e0def4;
    }

    #workspaces button.focused {
        color: #b084f4;
        border-bottom: 3px solid #b084f4;
    }

    #battery, #clock, #pulseaudio {
        padding: 0 10px;
        color: #c4a7e7;
    }
  '';
  };
}
