local M = {}

function M.setup()
	-- Open the corresponding spec file in a vertical split
	vim.api.nvim_create_autocmd("FileType", {
		pattern = "ruby",
		callback = function()
			local cwd = vim.fn.getcwd()
			if not cwd:match("^/Users/yoranbrondsema/Projects/Curvo/curvo") then
				return
			end

			vim.keymap.set("n", "<leader>tt", function()
				local current_file = vim.fn.expand("%:p")

				local spec_file = current_file:gsub("^(.*/)(app/)", "%1spec/backend/"):gsub("%.rb$", "_spec.rb")

				if vim.fn.filereadable(spec_file) == 1 then
					vim.cmd("vsplit " .. spec_file)
				else
					vim.notify("Spec file not found: " .. spec_file, vim.log.levels.WARN)
				end
			end, { buffer = true, desc = "Open spec file in vertical split" })
		end,
	})
end

return M
