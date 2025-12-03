local M = {}

function M.setup()
	-- Open component.js from HBS file
	vim.api.nvim_create_autocmd("FileType", {
		pattern = "handlebars",
		callback = function()
			local cwd = vim.fn.getcwd()
			if not cwd:match("^/Users/yoranbrondsema/Projects/Sutori/sutori") then
				return
			end

			vim.keymap.set("n", "<leader>pc", function()
				local current_dir = vim.fn.expand("%:p:h")
				local component_file = current_dir .. "/component.js"
				vim.cmd("vsplit " .. vim.fn.fnameescape(component_file))
			end, { buffer = true, desc = "Open component.js in vertical split" })
		end,
	})

	-- Open template.hbs from JavaScript file
	vim.api.nvim_create_autocmd("FileType", {
		pattern = "javascript",
		callback = function()
			local cwd = vim.fn.getcwd()
			if not cwd:match("^/Users/yoranbrondsema/Projects/Sutori/sutori") then
				return
			end

			vim.keymap.set("n", "<leader>pt", function()
				local current_dir = vim.fn.expand("%:p:h")
				local template_file = current_dir .. "/template.hbs"
				vim.cmd("vsplit " .. vim.fn.fnameescape(template_file))
			end, { buffer = true, desc = "Open template.hbs in vertical split" })
		end,
	})
end

return M
