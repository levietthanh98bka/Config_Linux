return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = { "hrsh7th/cmp-buffer" },
  opts = function()       --If want to use config instead of opts you must call require.setup(***)
    local cmp = require("cmp")
    return {
      sources = {
        { name = "buffer" },
      },
      mapping = cmp.mapping.preset.insert({
        ["<Tab>"] = cmp.mapping.select_next_item(),
        ["<S-Tab>"] = cmp.mapping.select_prev_item(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
      }),
    }
  end,
}
