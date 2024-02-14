---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<leader>P"] = { "<cmd> Lazy <CR>", "Lazy plugin mgr" },
    ["<leader>M"] = { "<cmd> Mason <CR>", "Mason package mgr" },
    ["<leader>H"] = { "<cmd> Htop <CR>", "Htop system monitor" },
    ["<leader>G"] = { "<cmd> Lazygit <CR>", "Lazygit command" },
    ["<leader>L"] = { "<cmd> Lazyman <CR>", "Lazyman menu" },
    ["<leader>C"] = { "<cmd> Lazyconf <CR>", "Lazyman configuration" },
    ["<leader>A"] = { "<cmd> Asciiville <CR>", "Asciiville" },
    ["<leader>q"] = { "<cmd> quitall! <CR>", "quit" },
    ["<leader>tT"] = {
      function()
        require("base46").toggle_transparency()
      end,
      "toggle transparency"
    },
    ["<leader>tt"] = {
      function()
        require("base46").toggle_theme()
      end,
      "toggle theme"
    },
  },
}

M.symbols_outline = {
  n = {
    ["<leader>cs"] = { "<cmd>SymbolsOutline<cr>", "Symbols Outline" },
  },
}

M.dap = {
  plugin = true,
  n = {
    ["<leader>db"] = {
      "<cmd> DapToggleBreakpoint <CR>",
      "Add breakpoint at line"
    },
    ["<leader>dus"] = {
      function()
        local widgets = require('dap.ui.widgets');
        local sidebar = widgets.sidebar(widgets.scopes);
        sidebar.open();
      end,
      "Open debugging sidebar"
    }
  }
}

M.dap_go = {
  plugin = true,
  n = {
    ["<leader>dgt"] = {
      function()
        require('dap-go').debug_test()
      end,
      "Debug go test"
    },
    ["<leader>dgl"] = {
      function()
        require('dap-go').debug_last()
      end,
      "Debug last go test"
    }
  }
}

M.dap_python = {
  plugin = true,
  n = {
    ["<leader>dpr"] = {
      function()
        require('dap-python').test_method()
      end
    }
  }
}

M.gopher = {
  plugin = true,
  n = {
    ["<leader>gsj"] = {
      "<cmd> GoTagAdd json <CR>",
      "Add json struct tags"
    },
    ["<leader>gsy"] = {
      "<cmd> GoTagAdd yaml <CR>",
      "Add yaml struct tags"
    }
  }
}

return M
