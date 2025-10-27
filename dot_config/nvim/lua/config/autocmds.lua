local au = vim.api.nvim_create_autocmd

au("InsertEnter", {
	command = "set norelativenumber",
})

au("InsertLeave", {
	command = "set relativenumber",
})

-- Highlight when yanking (copying) text. See :help vim.hl.on_yank()
--  Try it with `yap` in normal mode
au("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
	callback = function()
		vim.hl.on_yank()
	end,
})
