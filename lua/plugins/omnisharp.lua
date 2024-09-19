return {
	"Hoffs/omnisharp-extended-lsp.nvim",

	config = function()
		vim.api.nvim_set_keymap(
			"n",
			"gr",
			"<cmd>lua require('omnisharp_extended').telescope_lsp_references()<CR>",
			{ noremap = true, silent = true }
		)
		vim.api.nvim_set_keymap(
			"n",
			"gd",
			"<cmd>lua require('omnisharp_extended').telescope_lsp_definition({ jump_type = 'vsplit' })<CR>",
			{ noremap = true, silent = true }
		)
		vim.api.nvim_set_keymap(
			"n",
			"gD",
			"<cmd>lua require('omnisharp_extended').telescope_lsp_type_definition()<CR>",
			{ noremap = true, silent = true }
		)
		vim.api.nvim_set_keymap(
			"n",
			"gi",
			"<cmd>lua require('omnisharp_extended').telescope_lsp_implementation()<CR>",
			{ noremap = true, silent = true }
		)
	end,
}
