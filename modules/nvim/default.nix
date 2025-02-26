{
  lib,
  config,
  pkgs,
  ...
}:
with lib;
let
  cfg = config.modules.nvim;
in
{
  options.modules.nvim = {
    enable = mkEnableOption "nvim";
  };
  config = mkIf cfg.enable {
    programs.nvchad = {
      enable = true;
      neovim = pkgs.neovim;
      extraPackages = with pkgs; [
        nodePackages.bash-language-server
        docker-compose-language-service
        dockerfile-language-server-nodejs
        lua-language-server
        nil
        nixfmt-rfc-style
        basedpyright
        gopls
        gofumpt
        rust-analyzer
        (python3.withPackages(ps: with ps;[
          python-lsp-server
          flake8
        ]))
      ];
      extraConfig = ''
        local nvlsp = require "nvchad.configs.lspconfig"
        local lspconfig = require "lspconfig"

        nvlsp.defaults() -- loads nvchad's defaults
        
        local servers = {
          "basedpyright",
          "gopls",
          "rust_analyzer",
        }

        -- lsps with default config
        for _, lsp in ipairs(servers) do
          lspconfig[lsp].setup{
            on_attach = nvlsp.on_attach,
            on_init = nvlsp.on_init,
            capabilities = nvlsp.capabilities,
          }
        end
        -- lsps with custom configs
        lspconfig.nil_ls.setup({
          settings = {
            ['nil'] = {
              formatting = {
                command = { "nixfmt" },
              },
            },
          },
        })
        require('render-markdown').enable()
      '';
      extraPlugins = ''
        return {
          {
            "williamboman/mason.nvim",
            opts = {
              ensure_installed = {
                "basedpyright",
                "python-lsp-server",
                "gopls",
                "nil",
                "flake8",
                "gofumpt",
                "rust-analyzer",
                "lua-language-server",
                "bash-language-server",
                "docker-compose-language-service",
                "dockerfile-language-server",
              }
            }
          },
          {
            'MeanderingProgrammer/render-markdown.nvim',
            dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' },
            opts = {},
          }
        }
      '';
      hm-activation = true;
      backup = true;
    };
  };
}
