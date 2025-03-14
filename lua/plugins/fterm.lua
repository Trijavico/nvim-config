local fterm = require("FTerm")

vim.keymap.set({ "n", "t" }, "<leader>,", function() 
	fterm.toggle() 
end, { noremap = true, silent = true })
