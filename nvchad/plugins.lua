local plugins = {
  {
    "hrsh7th/nvim-cmp",
    opts = function()
      require "plugins.configs.cmp"
      require "custom.configs.cmp"
    end,
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },

  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "pyright",
      },
    },
  },

  {
    "windwp/nvim-autopairs",
    enabled = false
  }
}

return plugins
