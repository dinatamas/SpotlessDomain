-- https://nvchad.com/docs/config/walkthrough#config_structure
-- Use this file to override core/default_config.lua.
-- https://github.com/NvChad/example_config/

local M = {}

M.plugins = 'custom.plugins'

M.ui = {
  cheatsheet = { theme = "simple" },
  lsp_semantic_tokens = true,
  statusline = {
    -- https://nvchad.com/docs/config/nvchad_ui
    overriden_modules = function(m)
      -- Remove unnecessary space before file type.
      m[2] = (function() local x = m[2]; return x:sub(1, 15) .. x:sub(17, -1); end)()
      table.remove(m, 3)  -- git status
      table.remove(m, 7)  -- LSP status
      -- Show cursor column position.
      m[8] = (function() local x = m[8]; return x .. "%c"; end)()
    end
  },
  theme = 'catppuccin',
  transparency = true,
}

return M
