-- Treesitter
return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	branch = "main",
	build = ":TSUpdate",
	config = function()
		local config = require("nvim-treesitter")
		config.setup({
			auto_install = true,
			ensure_installed = { "lua", "bash", "cpp", "cmake", "json", "yaml", "zig", "rust" },
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}
