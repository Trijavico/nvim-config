local idx = 1
local themes = {
	{ "catppuccin", "catppuccin" },
	{ "pywal16", "pywal16-nvim" },
}

local switch_theme = function()
	idx = idx % #themes + 1
	local colorscheme, lualine = unpack(themes[idx])

	vim.cmd.colorscheme(colorscheme)
	require("lualine").setup({
		options = { theme = lualine },
	})
end

vim.api.nvim_create_user_command("Colortheme", switch_theme, {})
vim.keymap.set("n", "<leader>cs", switch_theme, {})
