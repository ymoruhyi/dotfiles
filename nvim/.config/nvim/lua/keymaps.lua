vim.keymap.set("n", "<leader>t", ":Term<CR>", { desc = "Open bottom terminal" })
vim.keymap.set("n", "<leader>e", ":Explore<CR>", { desc = "Open netrw explorer" })

-- Use custom move line keymaps with J and K
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { silent = true })
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { silent = true })

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- copy from my old config
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "*", "*zzzv")
vim.keymap.set("n", "#", "#zzzv")

-- Move to window using the <alt> hjkl keys
vim.keymap.set("n", "<A-h>", "<C-w>h")
vim.keymap.set("n", "<A-j>", "<C-w>j")
vim.keymap.set("n", "<A-k>", "<C-w>k")
vim.keymap.set("n", "<A-l>", "<C-w>l")

-- Easier window resize
vim.keymap.set("n", "<A-Up>", function()
	vim.cmd("resize +2")
end, { desc = "Taller" })

vim.keymap.set("n", "<A-Down>", function()
	vim.cmd("resize -2")
end, { desc = "Shorter" })

vim.keymap.set("n", "<A-Right>", function()
	vim.cmd("vertical resize +2")
end, { desc = "Wider" })

vim.keymap.set("n", "<A-Left>", function()
	vim.cmd("vertical resize -2")
end, { desc = "Narrower" })

vim.keymap.set("n", "<A-=>", "<C-w>=", { desc = "Equalize" })

-- Press <Esc> twice to exit terminal mode into Normal mode
vim.keymap.set("t", "<Esc><Esc>", [[<C-\><C-n>]], { desc = "Exit terminal mode" })

-- Move to window using the <alt> hjkl keys from inside terminal mode in terminal emulator
vim.keymap.set("t", "<A-h>", [[<Cmd>wincmd h<CR>]], { desc = "Move to left window" })
vim.keymap.set("t", "<A-j>", [[<Cmd>wincmd j<CR>]], { desc = "Move to bottom window" })
vim.keymap.set("t", "<A-k>", [[<Cmd>wincmd k<CR>]], { desc = "Move to top window" })
vim.keymap.set("t", "<A-l>", [[<Cmd>wincmd l<CR>]], { desc = "Move to right window" })

-- better indenting
vim.keymap.set("x", "<", "<gv")
vim.keymap.set("x", ">", ">gv")

-- LSP
local function scroll_hover(key)
	return function()
		local win = vim.b.lsp_floating_preview
		if win and vim.api.nvim_win_is_valid(win) then
			vim.api.nvim_win_call(win, function()
				vim.cmd("normal! " .. vim.keycode(key))
			end)
		else
			-- popup window is not active, fallbal to normal page scrolling
			-- vim.cmd("normal! " .. vim.keycode(key))
			if key == "<C-d>" then
				vim.api.nvim_feedkeys(
					vim.keycode(vim.api.nvim_replace_termcodes("<C-f>", true, false, true)),
					"n",
					false
				)
			else
				vim.api.nvim_feedkeys(
					vim.keycode(vim.api.nvim_replace_termcodes("<C-b>", true, false, true)),
					"n",
					false
				)
			end
		end
	end
end

vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "LSP definition" })
vim.keymap.set("n", "<C-f>", scroll_hover("<C-d>"), { desc = "Scroll hover / half page down" })
vim.keymap.set("n", "<C-b>", scroll_hover("<C-u>"), { desc = "Scroll hover / half page up" })

vim.keymap.set("n", "<leader>xx", function()
	vim.diagnostic.setloclist({ open = true })
end, { desc = "Buffer diagnostics (location list)" })

vim.keymap.set("n", "<leader>xX", function()
	vim.diagnostic.setqflist({ open = true })
end, { desc = "All diagnostics (quickfix list)" })

vim.keymap.set("n", "<leader>td", function()
	local is_enabled = vim.diagnostic.is_enabled({ bufnr = 0 })
	vim.diagnostic.enable(not is_enabled, { bufnr = 0 })
	print("Diagnostics", is_enabled and "disabled" or "enabled")
end, { desc = "Toggle buffer diagnostics" })

vim.keymap.set("n", "gK", function()
	vim.cmd.help(vim.fn.expand("<cword>"))
end, { desc = "Help for word under cursor" })
