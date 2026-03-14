{ pkgs, ... }: {
  homebrew = {
    enable = true;
    onActivation.cleanup = "zap";
    casks = [
      "discord"
      "ghostty"
      "iina"
      "iterm2"
      "keka"
      "obs"
      "obsidian"
      "spotify"
      "telegram"
      "termius"
      "utm"
      "visual-studio-code"
      "whatsapp"
      "zed"
      "onlyoffice"
    ];
  };
}