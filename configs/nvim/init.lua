--- Safely require a module, return nil on failure.
--- @param module string The module name to require.
--- @param silent? boolean If true, suppresses error messages.
--- @return any|nil loaded_module Returns the module if successful, nil otherwise.
local function try_require(module, silent)
  local ok, loaded = pcall(require, module)
  if not ok then
    if not silent then
      print("Failed to require '" .. module .. "': " .. loaded)
    end
    return {}
  end
  return loaded
end


-- Setup theme default when first install nvim(if don't install any plugin)
-- open nvim -> :colorscheme -> press tab -> show list theme availble
-- vim.cmd("syntax on")
-- vim.cmd("colorscheme desert")      -- Chọn 1 colorscheme có sẵn (desert, peachpuff, evening,...)

----------------------------------------------- CORE -----------------------------------------------

try_require("core.options")
try_require("core.keymaps")

----------------------------------------------- LAZY -----------------------------------------------
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  print("lazy.nvim not installed!")
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    error("Error cloning lazy.nvim:\n" .. out)
  end
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = {
    -- Theme
    try_require("plugins.catppuccin"),

    -- Functionality
    try_require("plugins.comment"),
    try_require("plugins.telescope"),
    try_require("plugins.autocomplete"),
    try_require("plugins.undotree"),
    try_require("plugins.bufferline"),
    
    -- UI
    try_require("plugins.nvim-tree"),
    try_require("plugins.lualine"),
    try_require("plugins.alpha"),
    try_require("plugins.mix"),

    -- Devlopment
    -- try_require("plugins.treesitter"),
    -- try_require("plugins.lsp"),
  },
  install = { colorscheme = { "catppuccin" } }, -- Config temporary theme for first time setup flugin
  checker = { enabled = false },                -- Automatically check for plugin updates periodically: enabled = false -> not auto upate.
})
