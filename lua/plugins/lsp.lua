require("lazydev").setup({
	library = {
		{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
	},
})

vim.api.nvim_create_autocmd("LspAttach", {
	desc = "LSP actions",
	callback = function(event)
		local opts = { buffer = event.buf }

		vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
		vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
		vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
		vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
		vim.keymap.set("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts)
		vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
		vim.keymap.set("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
		vim.keymap.set("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
		vim.keymap.set({ "n", "x" }, "<leader>f", "<cmd>lua vim.lsp.buf.format({async = true})<cr>", opts)
		vim.keymap.set("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
	end
})

require("mason").setup({})
require("mason-lspconfig").setup({
	ensure_installed = {
		"lua_ls",
		"gopls",
		"clangd",
		"rust_analyzer",
		"emmet_ls",
		"pyright",
		"cssls",
		"tailwindcss",
		"templ",
		"volar",
		"ts_ls",
	}
})

require("lspconfig").rust_analyzer.setup({})
require("lspconfig").pyright.setup({})
require("lspconfig").tailwindcss.setup({})
require("lspconfig").cssls.setup({})

require("lspconfig").gopls.setup({
	settings = {
		gopls = {
			hints = {
				assingVariableTypes = true,
				compositeLiteralFields = true,
				compositeLiteralTypes = true,
				constantValues = true,
				functionTypeParameters = true,
				parameterNames = true,
				rangeVariableTypes = true,
			},
		},
	}
})

require("lspconfig").clangd.setup({
	cmd = {
		"clangd",
		"--fallback-style=none",
	},
	init_options = { clangdFileStatus = true },
	filetypes = { "h", "c", "cpp", "cc", "objc", "objcpp" },
})

require("lspconfig").emmet_ls.setup({
	filetypes = {
		"html",
		"css",
		"templ",
		"vue",
		"javascriptreact",
	},
	init_options = {
		html = {
			options = {
				["bem.enabled"] = true,
				["output.format"] = false,
			},
		},
	}
})

require("lspconfig").volar.setup({
	init_options = {
		vue = {
			hybridMode = false
		},
	}
})

local vue_lsp_path = require("mason-registry").get_package("vue-language-server"):get_install_path() .. "/node_modules/@vue/language-server"
require("lspconfig").ts_ls.setup({
	init_options = {
		plugins = {
			{
				name = "@vue/typescript-plugin",
				location = vue_lsp_path,
				languages = { "vue" },
			},
		},
	}
})

require("lspconfig").lua_ls.setup({
	settings = {
		Lua = {
			completion = {
				callSnippet = "Replace",
			},
		},
	},
})
