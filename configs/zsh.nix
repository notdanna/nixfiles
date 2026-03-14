{ pkgs, ... }: {

  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "zoxide" "fzf" ];
    };

    plugins = [
      {
        name = "powerlevel10k";
        src = pkgs.zsh-powerlevel10k;
        file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
      }
      {
        name = "powerlevel10k-config";
        src = ./dependencies/p10k.zsh;
        file = "p10k.zsh";
      }
    ];

    shellAliases = {
      ls    = "eza --icons=always --group-directories-first";
      ll    = "eza -la --icons=always --group-directories-first";
      lt    = "eza --tree --icons=always";
      grep  = "rg";
      find  = "fd";
      cd    = "z";
      nv    = "nvim";
      cl    = "clear";
      ff    = "fastfetch -c ~/.config/fastfetch/presets/nyarch.jsonc";
      sshl  = "ssh dam@192.168.1.77";
      ssht  = "ssh dam@100.100.95.111";

      nixb  = "sudo darwin-rebuild switch --flake ~/.config/nix#dam";
      nixu  = "nix flake update ~/.config/nix && sudo darwin-rebuild switch --flake ~/.config/nix#dam";
      nixs  = "nix search nixpkgs";
      nixc  = "nix-collect-garbage -d";
      nixcd = "cd ~/.config/nix";
    };

    initContent = ''
      eval "$(zoxide init zsh)"
      [[ -f ~/.fzf.zsh ]] && source ~/.fzf.zsh
      [[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

      unalias nixrun 2>/dev/null
      nixrun() { nix run nixpkgs#$1; }
      unalias nixtry 2>/dev/null
      nixtry() { nix shell nixpkgs#$1; }
      # ...
    '';
  };

  programs.zoxide.enable = true;
  programs.fzf.enable = true;

}