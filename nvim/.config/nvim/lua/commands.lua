-- Open a terminal at the bottom with height 15
vim.api.nvim_create_user_command("Term", function(opts)
	local cmd = opts.args ~= "" and (" " .. opts.args) or ""
	vim.cmd("botright 15split | term" .. cmd)
end, { nargs = "*" })

vim.api.nvim_create_user_command("Run", function(opts)
	-- Run the shell command and capture output lines
	local output = vim.fn.systemlist(opts.args)

	-- Open a 15-line split at the bottom
	vim.cmd("botright 15new" .. "")
	local buf = vim.api.nvim_get_current_buf()

	-- Make it a disposable scratch buffer (no file attached, no save warnings)
	vim.bo[buf].buftype = "nofile"
	vim.bo[buf].bufhidden = "wipe"
	vim.bo[buf].swapfile = false

	-- Insert the command output into the buffer
	vim.api.nvim_buf_set_lines(buf, 0, -1, false, output)
end, { nargs = "+", complete = "shellcmd" })

vim.api.nvim_create_autocmd("PackChanged", {
	callback = function(ev)
		local name, kind = ev.data.spec.name, ev.data.kind

		-- update treesitter parsers when nvim-treesitter changes in the pack
		if name == "nvim-treesitter" and kind == "update" then
			if not ev.data.active then
				vim.cmd.packadd("nvim-treesitter")
			end
			vim.cmd("TSUpdate")
		end

		-- build telescope-fzf-native after it's installed or updated
		if name == "telescope-fzf-native.nvim" and (kind == "install" or kind == "update") then
			vim.system({ "make" }, { cwd = ev.data.path }):wait()
		end
	end,
})
