{ pkgs, ... }: {

  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 36;
        spacing = 0;
        reload_style_on_change = true;

        modules-left = [
            "niri/workspaces"
            "custom/playerctl"
            "group/apps"
        ];
        modules-center = [];
        modules-right = [
            "pulseaudio"
            "network"
            "group/power"
            "clock"
            "tray"
        ];

        "niri/window" = {
            format = " {title}";
            max-length = 35;
            separate-outputs = true;
            rewrite = {
                "^.*( — Zen Browser|Zen Browser)$" = "󰈹 Zen";
                "^.*( — Firefox|Firefox)$" = "󰈹 Firefox";
                "^.*v( .*|$)" = " Neovim";
                "^.*~$" = "󰄛 Kitty";
                "^.*(- Spotify|Spotify)$" = "󰏤 Spotify";
                "^.+ $" = " Empty";
            };
        };

        "niri/workspaces" = {
            format = "{index}";
            format-icons = {
                default = "󰊠";
            };
        };

        "custom/playerctl" = {
            format = "{text}";
            return-type = "json";
            max-length = 45;
            exec = "playerctl metadata --format '{\"text\": \"{{artist}} - {{title}}\", \"alt\": \"{{status}}\", \"class\": \"{{status}}\"}' -F";
            on-click = "playerctl play-pause";
            on-click-right = "playerctl next";
            on-click-middle = "playerctl previous";
        };

        "group/apps" = {
            orientation = "horizontal";
            drawer = { "transition-duration" = 300; "transition-left-to-right" = true; };
            modules = ["custom/arrow-right" "cpu" "memory"];
        };

        "group/power" = {
            orientation = "horizontal";
            drawer = { "transition-duration" = 300; "transition-left-to-right" = false; };
            modules = ["battery" "power-profiles-daemon"];
        };

        "cpu" = { "format" = " 󰘚 {usage}%  "; };
        "memory" = { "format" = " {percentage}%"; };

        "battery" = {
            states = { "good" = 95; "warning" = 30; "critical" = 15; };
            format = "{icon}";
            format-charging = "<b>{icon}</b>";
            format-icons = ["" "" "" "" ""];
            tooltip-format = "{timeTo} {capacity}% | {power} W";
        };

        "pulseaudio" = {
            format = "{volume}% {icon}";
            format-muted = "󰖁";
            format-icons = { "default" = ["󰕿" "󰖀" "󰕾"]; };
            on-click = "pavucontrol";
        };

        "network" = {
            format-wifi = "󰤨";
            format-ethernet = "󰈁";
            format-disconnected = "󰖪";
            tooltip-format = "{essid} ({signalStrength}%)";
        };

        "clock" = {
            format = "{:%H:%M}";
            tooltip-format = "<tt><big>{calendar}</big></tt>";
            calendar = {
                mode = "month";
                format = {
                    months = "<span color='#b084f4'><b>{}</b></span>";
                    today = "<span color='#eb6f92'><b><u>{}</u></b></span>";
                };
            };
        };

        "custom/arrow-right" = { "format" = " 󰁙  "; "tooltip" = false; };
        "tray" = { "spacing" = 8; };
      };
    };
    style = ''
        * {
            border: none;
            border-radius: 0;
            font-family: "JetBrainsMono Nerd Font";
            font-size: 11px;
            font-weight: 800;
            min-height: 0;
        }

        window#waybar {
            background: #000000;
            color: #e0def4;
        }

        #workspaces, #window, #pulseaudio, #network, #battery, #clock, #playerctl, #tray {
            background: rgba(26, 23, 58, 0);
            color: #b084f4;
            margin: 4px 2px;
            padding: 0px 8px;
            border-radius: 0px;
        }

        #clock { margin-right: 8px; }

        #workspaces { background: transparent; border: none; }
        #workspaces button {
            padding: 0 6px;
            margin: 0 2px;
            color: rgba(224, 222, 244, 0.4);
        }

        #workspaces button.focused {
            color: #b084f4;
            box-shadow: inset 0 -2px 0 #b084f4;
        }

        #cpu, #memory { margin: 4px 0px; }
        #cpu { color: #9ccfd8; }
        #memory { color: #c4a7e7; }
        #battery.charging { color: #9ccfd8; }
        #battery.warning { color: #f6c177; }
        #battery.critical { color: #eb6f92; }
        #tray { margin-right: 8px; }
    '';
  };

}