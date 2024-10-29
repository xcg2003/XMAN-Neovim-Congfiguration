-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Load all plugins from the xavier/plugins directory
local plugin_files = vim.fn.globpath(vim.fn.stdpath("config") .. "/lua/xavier/plugins", "*.lua", false, true)
local plugins = {}

-- Loop through each Lua file in the plugins directory
for _, file in ipairs(plugin_files) do
  local plugin = dofile(file)  -- Load the plugin configuration file
  table.insert(plugins, plugin)
end

-- Setup lazy.nvim with the list of plugins
require("lazy").setup({
  spec = {
    { import = "xavier.plugins" },-- Make sure this is the correct path to your plugins module
    { import = "xavier.plugins.lsp"},
  },
})
