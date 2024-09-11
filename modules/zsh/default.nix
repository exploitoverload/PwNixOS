{
  pkgs,
  lib,
  config,
  ...
}:
with lib; let
  cfg = config.modules.zsh;
in {
  options.modules.zsh = {enable = mkEnableOption "zsh";};
  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      zsh
      fzf
    ];

    programs.zoxide = {
      enable = true;
      enableZshIntegration = true;
    };

    programs.zsh = {
      enable = true;

      dotDir = ".config/zsh";

      enableCompletion = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;

      initExtra = ''
        bindkey "^[[1;3C" forward-word                  # Key Alt + Right
        bindkey "^[[1;3D" backward-word                 # Key Alt + Left
      '';

      shellAliases = {
        cat = "bat";
        cd = "z";
        vi = "nvim";
        vim = "nvim";
        ls = "eza --icons";
        tree = "eza --tree --icons";
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
        {
          name = "zsh-nix-shell";
          file = "nix-shell.plugin.zsh";
          src = pkgs.fetchFromGitHub {
            owner = "chisui";
            repo = "zsh-nix-shell";
            rev = "v0.8.0";
            sha256 = "1lzrn0n4fxfcgg65v0qhnj7wnybybqzs4adz7xsrkgmcsr0ii8b7";
          };
        }
      ];
    };
  };
}
