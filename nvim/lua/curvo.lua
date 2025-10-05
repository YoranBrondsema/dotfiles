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

			vim.keymap.set("n", "<leader>ot", function()
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

	-- Open all translation files in splits
	vim.api.nvim_create_autocmd("FileType", {
		pattern = "json",
		callback = function()
			local cwd = vim.fn.getcwd()
			if not cwd:match("^/Users/yoranbrondsema/Projects/Curvo/curvo") then
				return
			end

			vim.keymap.set("n", "<leader>ot", function()
				local current_file = vim.fn.expand("%:p")

				-- Check if this is a translation file
				if not current_file:match("src/translations/[^/]+/") then
					vim.notify("Not a translation file", vim.log.levels.WARN)
					return
				end

				-- Extract the relative path after the locale directory
				local relative_path = current_file:match("src/translations/[^/]+/(.+)$")
				if not relative_path then
					vim.notify("Could not parse translation file path", vim.log.levels.ERROR)
					return
				end

				-- Dynamically discover all locale directories
				local translations_dir = vim.fn.getcwd() .. "/src/translations"
				local locale_dirs = vim.fn.readdir(translations_dir, function(name)
					return vim.fn.isdirectory(translations_dir .. "/" .. name) == 1
				end)

				local current_locale = current_file:match("src/translations/([^/]+)/")

				for _, locale in ipairs(locale_dirs) do
					if locale ~= current_locale then
						local file_path = translations_dir .. "/" .. locale .. "/" .. relative_path
						if vim.fn.filereadable(file_path) == 1 then
							vim.cmd("split " .. vim.fn.fnameescape(file_path))
						else
							vim.notify("File not found: " .. file_path, vim.log.levels.WARN)
						end
					end
				end
			end, { buffer = true, desc = "Open all translation files" })
		end,
	})
end

return M
