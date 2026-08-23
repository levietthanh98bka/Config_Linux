return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.4",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    require("telescope").setup()
    local builtin = require("telescope.builtin")
    vim.keymap.set("n", "<C-p>", builtin.find_files, {desc = "Telescope: Find files"})        -- Ctrl + p to open find file 
    -- vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>")                      -- Other ways
    vim.keymap.set("n", "<leader>fg", builtin.live_grep, {desc = "Telescope: Live grep"})     -- Space + f + g to live grep search
  end,

}
