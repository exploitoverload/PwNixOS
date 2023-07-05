{ pkgs, lib, config, ... }:

with lib;
let cfg = config.modules.zsh;

in {
  options.modules.zsh =  { enable = mkEnableOption "zsh";  };
  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      zsh
        fzf
    ];

    programs.zsh = {
      enable = true;

      dotDir = ".config/zsh";

      enableCompletion = true;
      autosuggestions.enable = true;
      syntaxHighlighting.enable = true;

      shellAliases = {
        cat = "bat";
        vi = "nvim";
        vim = "nvim";
        ls = "exa --icons";
        tree = "exa --tree --icons";
      };

      plugins = with pkgs; [
      {
        name = "powerlevel10k";
        src = "${zsh-powerlevel10k}/share/zsh-powerlevel10k";
        file = "powerlevel10k.zsh-theme";
      }
      {
        name = "powerlevel10k-config";
        src = ./.;
        file = ".p10k.zsh";
      }
      {
        name = "fzf-zsh";
        src = "${fzf-zsh}/share/zsh/plugins/fzf-zsh";
        file = "fzf-zsh.plugin.zsh";
      }
      {
        name = "sudo-zsh";
        src = ./.;
        file = "sudo.plugin.zsh";
        }
      ];
    };
  }; 
}
