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

      # Nix
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

      nixrun() { nix run nixpkgs#$1; }
      nixtry() { nix shell nixpkgs#$1; }

      # conda
      __conda_setup="$('/Users/dam/miniforge3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
      if [ $? -eq 0 ]; then
          eval "$__conda_setup"
      else
          if [ -f "/Users/dam/miniforge3/etc/profile.d/conda.sh" ]; then
              . "/Users/dam/miniforge3/etc/profile.d/conda.sh"
          else
              export PATH="/Users/dam/miniforge3/bin:$PATH"
          fi
      fi
    '';
  };

  programs.zoxide.enable = true;
  programs.fzf.enable = true;

}