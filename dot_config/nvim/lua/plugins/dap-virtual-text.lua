return {
	"theHamsta/nvim-dap-virtual-text",
	opts = {
		enabled = false,
		enabled_commands = true,
		highlight_changed_variables = true,
		highlight_new_as_changed = false,
		show_stop_reason = true,
		commented = false,
		only_first_definition = true,
		all_references = true,
		clear_on_continue = false,

		display_callback = function(variable, buf, stackframe, node, options)
			if options.virt_text_pos == "inline" then
				return " = " .. variable.value
			end
			return variable.name .. " = " .. variable.value
		end,

		virt_text_pos = vim.fn.has("nvim-0.11") and "inline" or "eol",

		all_frames = false,
		virt_lines = false,
		virt_text_win_col = nil,
	},
}
