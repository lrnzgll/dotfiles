local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.keymap.set

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Insert --
-- Press jk fast to exit insert mode
keymap("i", "jk", "<ESC>", opts)
keymap("i", "kj", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv^", opts)
keymap("v", ">", ">gv^", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m '>+1<CR>gv=gv", opts)
keymap("v", "<A-k>", ":m '<-2<CR>gv=gv", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":m '>+1<CR>gv=gv", opts)
keymap("x", "K", ":m '<-2<CR>gv=gv", opts)
keymap("x", "<A-j>", ":m '>+1<CR>gv=gv", opts)
keymap("x", "<A-k>", ":m '<-2<CR>gv=gv", opts)

-- Telescope --

local builtin = require('telescope.builtin')
keymap('n', '<leader>p', builtin.find_files, opts)
keymap('n', '<leader>g', builtin.live_grep, opts)
keymap('n', '<leader>b', builtin.buffers, opts)
keymap('n', '<leader>fd', builtin.lsp_definitions, opts)
keymap('n', '<leader>fi', builtin.lsp_implementations, opts)
keymap('n', '<leader>t', "<cmd>NvimTreeToggle<cr>", opts)


-- Neotest --
local neotest = require('neotest')

keymap('n', '<leader>rf', function() 
  neotest.run.run(vim.fn.expand("%")) 
  neotest.summary.open()
end, opts)
keymap('n', '<leader>rs', function() 
  neotest.run.run() 
  neotest.summary.open()
end, opts)

keymap('n', '<leader>rw', function() 
  neotest.watch.toggle()
end, opts)


keymap('i', '<C-e>', 'copilot#Accept("\\<CR>")', {
  expr = true,
  replace_keycodes = false
})
vim.g.copilot_no_tab_map = true
