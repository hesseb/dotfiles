-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Diagnostic keymaps
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Disable arrow keys in normal mode
vim.keymap.set({ "n", "v", "i" }, "<left>", '<cmd>echo "Use h to move."<CR>')
vim.keymap.set({ "n", "v", "i" }, "<right>", '<cmd>echo "Use l to move."<CR>')
vim.keymap.set({ "n", "v", "i" }, "<up>", '<cmd>echo "Use k to move."<CR>')
vim.keymap.set({ "n", "v", "i" }, "<down>", '<cmd>echo "Use j to move."<CR>')

-- Keybinds to make split navigation easier.
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- NOTE: Some terminals have colliding keymaps or are not able to send distinct keycodes
-- vim.keymap.set("n", "<C-S-h>", "<C-w>H", { desc = "Move window to the left" })
-- vim.keymap.set("n", "<C-S-l>", "<C-w>L", { desc = "Move window to the right" })
-- vim.keymap.set("n", "<C-S-j>", "<C-w>J", { desc = "Move window to the lower" })
-- vim.keymap.set("n", "<C-S-k>", "<C-w>K", { desc = "Move window to the upper" })

vim.keymap.set("i", "jj", "<Esc>", { desc = "Enter normal mode" })
vim.keymap.set("i", "kk", "<Esc>", { desc = "Enter normal mode" })
-- vim.keymap.set("i", "<C-c>", "<Esc>", { desc = "Normal mode" })

------ General
vim.keymap.set("n", "Q", "<nop>", { desc = "Disable mapping" })

vim.keymap.set(
	"n",
	"<leader>r",
	[[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
	{ desc = "Replace hovered word" }
)

vim.keymap.set("n", "n", "nzzzv", { desc = "Next search result while centering cursor" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous search result while centering cursor" })

vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll window down while centering cursor" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll window up while centering cursor" })
vim.keymap.set("i", "<C-b>", "<ESC>^i", { desc = "Move to the beginning of the line" })
vim.keymap.set("i", "<C-e>", "<End>", { desc = "Move to the end of the line" })

vim.keymap.set("i", "<C-h>", "<Left>", { desc = "Move left" })
vim.keymap.set("i", "<C-l>", "<Right>", { desc = "Move right" })
vim.keymap.set("i", "<C-j>", "<Down>", { desc = "Move down" })
vim.keymap.set("i", "<C-k>", "<Up>", { desc = "Move up" })

vim.keymap.set("n", "<C-s>", "<cmd>w<CR>", { desc = "General save file" })
