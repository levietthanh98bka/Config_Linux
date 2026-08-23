local autopairs = {
  -- Autoclose parentheses, brackets, quotes, etc.
  "windwp/nvim-autopairs",
  event = "InsertEnter",
  config = true,
  opts = {},
}
local colorizer = {
  -- High-performance color highlighter
  "norcalli/nvim-colorizer.lua",
  config = function()
    require("colorizer").setup()
  end,
}

return {
  autopairs,
  colorizer,
}
