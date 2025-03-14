local fterm = require("FTerm")

vim.keymap.set({ "n", "t" }, "<A-,>", function()
	fterm.toggle()
end, { noremap = true, silent = true })
