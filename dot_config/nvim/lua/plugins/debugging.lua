local function _select(items, opts, choice_transform)
	return coroutine.create(function(c)
		vim.ui.select(items, opts, function(choice)
			if choice_transform ~= nil then
				choice = choice_transform(choice)
			end
			coroutine.resume(c, choice)
		end)
	end)
end

local function GetExecutables()
	local fd_cmd = "fd"
		.. " --no-ignore"
		.. " --type x"
		.. " --exclude .git"
		.. " --exclude *.so*"
		.. " --exclude *.flac"
		.. " --exclude *.mp3"

	local cmd = io.popen(fd_cmd)
	local result = cmd:read("*a")
	cmd:close()

	local executables = vim.split(result, "\n", { trimempty = true })
	return _select(executables, { prompt = "executable to launch" })
end

local function GetPIDs()
	local cmd = io.popen("ps -a -o 'pid:1,cmd' --no-headers")
	local result = cmd:read("*a")
	cmd:close()

	local pids = vim.split(result, "\n", { trimempty = true })
	return _select(pids, { prompt = "pid to attach to" }, function(choice)
		return tonumber(vim.split(choice, " ")[1])
	end)
end

-- Debugging
return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"rcarriga/nvim-dap-ui",
			"nvim-neotest/nvim-nio",
			{ "theHamsta/nvim-dap-virtual-text", opts = {} },
		},

    --stylua: ignore
    keys = {
      { "<leader>dB", function() require("dap").set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, desc = "Breakpoint Condition" },
      { "<leader>db", function() require("dap").toggle_breakpoint() end, desc = "Toggle Breakpoint" },
      { "<leader>dc", function() require("dap").continue() end, desc = "Run/Continue" },
      { "<leader>da", function() require("dap").continue({ before = get_args }) end, desc = "Run with Args" },
      { "<leader>dC", function() require("dap").run_to_cursor() end, desc = "Run to Cursor" },
      { "<leader>dg", function() require("dap").goto_() end, desc = "Go to Line (No Execute)" },
      { "<leader>di", function() require("dap").step_into() end, desc = "Step Into" },
      { "<leader>dj", function() require("dap").down() end, desc = "Down" },
      { "<leader>dk", function() require("dap").up() end, desc = "Up" },
      { "<leader>dl", function() require("dap").run_last() end, desc = "Run Last" },
      { "<leader>do", function() require("dap").step_out() end, desc = "Step Out" },
      { "<leader>dO", function() require("dap").step_over() end, desc = "Step Over" },
      { "<leader>dP", function() require("dap").pause() end, desc = "Pause" },
      { "<leader>dr", function() require("dap").repl.toggle() end, desc = "Toggle REPL" },
      { "<leader>ds", function() require("dap").session() end, desc = "Session" },
      { "<leader>dt", function() require("dap").terminate() end, desc = "Terminate" },
      { "<leader>dw", function() require("dap.ui.widgets").hover() end, desc = "Widgets" },
    },

		config = function()
			local dap = require("dap")
			local dapui = require("dapui")

			require("dapui").setup()
			-- require("dap-go").setup()

			dap.listeners.before.attach.dapui_config = function()
				dapui.open()
			end

			dap.listeners.before.launch.dapup_config = function()
				dapui.open()
			end

			dap.listeners.before.event_terminated.dapui_config = function()
				dapui.close()
			end

			dap.listeners.before.event_exited.dapui_config = function()
				dapui.close()
			end

			dap.adapters.lldb = {
				name = "lldb",
				type = "executable",
				command = "/usr/bin/lldb-dap",
			}

			dap.adapters.gdp = {
				name = "gdb",
				type = "executable",
				command = "/usr/sbin/gdb",
				args = { "--interpreter=dap", "--eval-command", "set print pretty on" },
			}

			dap.configurations.cpp = {
				{
					name = "Launch (lldb)",
					type = "lldb",
					request = "launch",
					program = GetExecutables,
					cwd = "${workspaceFolder}",
					stopOnEntry = false,
					args = {},
				},
				{
					name = "Attach (lldb)",
					type = "lldb",
					request = "attach",
					pid = GetPIDs,
					cwd = "${workspaceFolder}",
				},
				{
					name = "Launch (gdb)",
					type = "gdb",
					request = "launch",
					program = GetExecutables,
					cwd = "${workspaceFolder}",
					stepAtBeginningOfMainSubProgram = false,
				},
				{
					name = "Attach (gdb)",
					type = "gdb",
					request = "attach",
					pid = GetPIDs,
					cwd = "${workspaceFolder}",
				},
			}

			dap.configurations.rust = {
				{
					name = "Launch (lldb)",
					type = "lldb",
					request = "launch",
					program = GetExecutables,
					cwd = "${workspaceFolder}",
					stopOnEntry = false,
					-- runInTerminal = true,
				},
				{
					name = "Attach (lldb)",
					type = "lldb",
					request = "attach",
					pid = GetPIDs,
					cwd = "${workspaceFolder}",
				},
			}
		end,
	},
	{
		"rcarriga/nvim-dap-ui",
		dependencies = { "nvim-neotest/nvim-nio" },

    --stylua: ignore
		keys = {
			{	"<leader>du",	function() require("dapui").toggle({}) end,	desc = "Dap UI" },
			{ "<leader>de", function() require("dapui").eval() end, desc = "Dap Eval", mode = { "n", "x" } },
		},
		opts = {},
		config = function(_, opts)
			local dap = require("dap")
			local dapui = require("dapui")
			dapui.setup(opts)
			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open({})
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close({})
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close({})
			end
		end,
	},
}
