{ ... }: {
  programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        font = "JetBrainsMono Nerd Font:size=12";
        prompt = "' '";
        padding-left = 15;
      };

      colors = {
        background = "1a1423dd";
        text = "e0def4ff";
        match = "b084f4ff";
        selection = "c4a7e7ff";
        selection-text = "111111ff";
        border = "b084f4ff";
      };

      border = {
        width = 2;
        radius = 0;
      };
    };
  };
}