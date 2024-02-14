local M = {}

-- lsp servers to install, see:
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
M.lsp_servers = {
  "awk_ls",
  "bashls",
  "cssmodules_ls",
  "denols",
  "dockerls",
  "eslint",
  "gopls",
  "html",
  "jsonls",
  "ltex",
  "marksman",
  "pylsp",
  "pyright",
  "sqlls",
  "tailwindcss",
  "terraformls",
  "texlab",
  "tsserver",
  "vimls",
  "yamlls",
}
-- Some Mason lsp server packages are named differently than in lspconfig. Why?
-- See: https://mason-registry.dev/registry/list
M.lsp_servers_mason = {
  "awk-language-server",
  "bash-language-server",
  "cssmodules-language-server",
  "deno",
  "dockerfile-language-server",
  "eslint-lsp",
  "gopls",
  "html-lsp",
  "json-lsp",
  "ltex-ls",
  "marksman",
  "python-lsp-server",
  "pyright",
  "sqlls",
  "tailwindcss-language-server",
  "terraform-ls",
  "texlab",
  "typescript-language-server",
  "vim-language-server",
  "yaml-language-server",
}

-- Formatters and linters installed by Mason
M.formatters_linters = {
  "actionlint",
  "goimports",
  "gofumpt",
  "golangci-lint",
  "google-java-format",
  "latexindent",
  "markdownlint",
  "prettier",
  "sql-formatter",
  "shellcheck",
  "shfmt",
  "stylua",
  "tflint",
  "yamllint",
  "pylint",
  "black",
}

M.mason = {
  ensure_installed = {},

  PATH = "prepend",

  ui = {
    check_outdated_packages_on_open = true,
    border = "single",
    width = 0.8,
    height = 0.9,
    icons = {
      package_pending = " ",
      package_installed = "󰄳 ",
      package_uninstalled = " 󰚌",
    },
    keymaps = {
      toggle_package_expand = "<CR>",
      install_package = "i",
      update_package = "u",
      check_package_version = "c",
      update_all_packages = "U",
      check_outdated_packages = "C",
      uninstall_package = "X",
      cancel_installation = "<C-c>",
      apply_language_filter = "<C-f>",
    },
  },
  log_level = vim.log.levels.INFO,
  max_concurrent_installers = 4,
}

M.treesitter = {
  ensure_installed = {
    "bash",
    "c",
    "cmake",
    "cpp",
    "css",
    "dockerfile",
    "dot",
    "elvish",
    "fish",
    "git_rebase",
    "gitattributes",
    "gitcommit",
    "gitignore",
    "go",
    "godot_resource",
    "gomod",
    "gowork",
    "html",
    "http",
    "java",
    "javascript",
    "jq",
    "json",
    "json5",
    "jsonc",
    "kotlin",
    "latex",
    "lua",
    "make",
    "markdown",
    "markdown_inline",
    "mermaid",
    "meson",
    "ninja",
    "nix",
    "org",
    "python",
    "regex",
    "rust",
    "sql",
    "svelte",
    "sxhkdrc",
    "todotxt",
    "toml",
    "typescript",
    "vim",
    "yaml",
    "zig",
  },
}

M.nvimtree = {
  git = {
    enable = true,
  },
  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

return M
