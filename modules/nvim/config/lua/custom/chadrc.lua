---@type ChadrcConfig
local M = {}

-- pick a random dashboard header
local header = require("custom.headers")["random"]

-- Path to overriding theme and highlights files
local highlights = require "custom.highlights"

M.ui = {
  theme_toggle = { "tokyonight", "catppuccin" },
  theme = "catppuccin",
  transparency = false,
  hl_override = highlights.override,
  hl_add = highlights.add,
  lsp_semantic_tokens = true, -- adds highlight groups for lsp semantic tokens
  telescope = { style = "bordered" }, -- borderless / bordered
  -- https://github.com/NvChad/base46/tree/v2.0/lua/base46/extended_integrations
  extended_integrations = { "notify" }, -- these aren't compiled by default, ex: "alpha", "notify"

  ------------------------------- nvchad_ui modules -----------------------------
  statusline = {
    separator_style = "round",
  },

  -- nvdash (dashboard)
  nvdash = {
    load_on_startup = true,
    header = header,
    buttons = {
      { "  Find File", ", f f", "Telescope find_files" },
      { "󰈚  Recent Files", ", f o", "Telescope oldfiles" },
      { "󰈭  Find Word", ", f w", "Telescope live_grep" },
      { "  Bookmarks", ", b m", "Telescope marks" },
      { "  Themes", ", t h", "Telescope themes" },
      { "  Mappings", ", c h", "NvCheatsheet" },
      { "󰅚  Quit", ", q  ", "quit" },
    },
  },

  cheatsheet = { theme = "grid" }, -- simple/grid
}

M.plugins = "custom.plugins"

M.lazy_nvim = {
  install = {
    colorscheme = { "nvchad" },
    -- install missing plugins on startup. This doesn't increase startup time.
    missing = true,
  },
  ui = {
    icons = {
      ft = "",
      lazy = "󰂠 ",
      loaded = "",
      not_loaded = "",
    },
    size = { width = 0.8, height = 0.8 },
    border = "rounded",
  },
}

-- check core.mappings for table structure
M.mappings = require "custom.mappings"

return M
