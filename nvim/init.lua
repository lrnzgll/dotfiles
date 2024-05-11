require("lrnzgll.options")
require("lrnzgll.lazy-config")
require("lrnzgll.telescope")
require("lrnzgll.keymaps")
require("lrnzgll.neo-tree")
require("lrnzgll.alpha-config")
require("lrnzgll.gruvbox")
require("lrnzgll.go-config")
require("lrnzgll.conform")
require("lrnzgll.buffers")

local ale = vim.fn.stdpath("config") .. "/lua/lrnzgll/ale.vim"
vim.cmd.source(ale)

local vimtest = vim.fn.stdpath("config") .. "/lua/lrnzgll/vimtest.vim"
vim.cmd.source(vimtest)

-- Automatically start Alpha dashboard on Neovim startup
vim.api.nvim_create_autocmd("VimEnter", {
	pattern = "*",
	callback = function()
		-- Check if Neovim is opened with a file or not
		if #vim.api.nvim_list_bufs() == 1 and vim.fn.bufname() == "" and vim.fn.argc() == 0 then
			vim.cmd("Alpha")
		end
	end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function(args)
		require("conform").format({ bufnr = args.buf })
	end,
})
