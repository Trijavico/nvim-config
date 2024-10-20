return {
	"xiyaowong/transparent.nvim",
	lazy = false,
	config = function()
		require("transparent").setup({
			enable = true,
			extra_groups = { -- table/string: additional groups that should be cleared
				"FloatBorder",
				"MsgArea",
				"TelescopeNormal",
				"TelescopeBorder",
				"TelescopePromptBorder",
				"SagaBorder",
				"SagaNormal",
			},
			exclude = {},
		})
	end,
}
