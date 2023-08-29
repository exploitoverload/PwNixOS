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
      enableAutosuggestions = true;
      syntaxHighlighting.enable = true;

      initExtra = ''
        bindkey "^[[1;3C" forward-word                  # Key Alt + Right
        bindkey "^[[1;3D" backward-word                 # Key Alt + Left
      '';

      shellAliases = {
        cat = "bat";
        vi = "nvim";
        vim = "nvim";
        ls = "exa --icons";
        tree = "exa --tree --icons";
        kali = "distrobox enter --root kali-rolling";
        kali-create = "distrobox create --root kalilinux/kali-rolling";
        arch = "distrobox enter --root archlinux";
        arch-create = "distrobox create --root archlinux";
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
