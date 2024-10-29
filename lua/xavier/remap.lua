vim.g.mapleader = " "

-- Change file nav cmd
vim.keymap.set("n", "<leader>fd", vim.cmd.Ex)


-- Make line numbers default
vim.opt.relativenumber = true

-- Tabs
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

-- Clipboard
vim.opt.clipboard:append("unnamedplus") -- use system clipboard

-- Telescope remap
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })


-- Nvim tree remap
vim.keymap.set('n','<leader>e', ':NvimTreeToggle<CR>', {desc = 'Toggle Nvim Tree'})
