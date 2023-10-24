local cmp = require("cmp")

local config = require("plugins.configs.cmp")

-- Do not autocomplete on Enter.
config.mapping["<CR>"] = nil
config.mapping["<S-Tab>"] = nil
config.mapping["<Tab>"] = cmp.mapping.confirm {
  behavior = cmp.ConfirmBehavior.Insert,
  select = true,
}

-- Only show useful autocomplete options.
config.sources = {
  {
    name = "nvim_lsp",
    entry_filter = function(entry, ctx)
      return cmp.lsp.CompletionItemKind.Text ~= entry:get_kind()
    end
  }
}
