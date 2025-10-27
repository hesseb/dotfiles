return {
	"nvim-mini/mini.nvim",
	version = "*",
	config = function()
		require("mini.ai").setup()
		require("mini.pairs").setup()
		require("mini.comment").setup()
		require("mini.move").setup()
		require("mini.splitjoin").setup()
		require("mini.surround").setup()
		require("mini.files").setup()
		require("mini.jump").setup()
		require("mini.jump2d").setup()
		require("mini.cursorword").setup()
		require("mini.icons").setup()
		require("mini.map").setup()
		require("mini.tabline").setup()
		require("mini.sessions").setup()
		require("mini.hipatterns").setup({
			highlighters = {
				-- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
				fixme = { pattern = "%f[%w]()FIXME()%f[%W]", group = "MiniHipatternsFixme" },
				hack = { pattern = "%f[%w]()HACK()%f[%W]", group = "MiniHipatternsHack" },
				todo = { pattern = "%f[%w]()TODO()%f[%W]", group = "MiniHipatternsTodo" },
				note = { pattern = "%f[%w]()NOTE()%f[%W]", group = "MiniHipatternsNote" },

				-- Highlight hex color strings (`#rrggbb`) using that color
				hex_color = require("mini.hipatterns").gen_highlighter.hex_color(),
			},
		})

		-- require("mini.align").setup()
		-- require("mini.keymap").setup() -- smart keymaps
		-- require("mini.operators").setup() -- need to learn more about this
		-- require("mini.basics").setup() -- basic config and keymaps
		-- require("mini.bufremove").setup() -- remove buffers while maintaining layout
		-- require("mini.notify").setup() -- stackable notifications
		-- require("mini.starter").setup() -- dashboard
	end,
  -- stylua: ignore
	keys = {
		{ "<leader>E", function() MiniFiles.open() end, desc = "Alternative File Explorer (mini.files)", },
    { "<leader>mm", function() MiniMap.toggle() end, desc = "Toggle mini map", },
	},
}
