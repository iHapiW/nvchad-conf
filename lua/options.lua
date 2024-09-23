require("nvchad.options")

-- add yours here!

local o = vim.o

-- Indenting
o.shiftwidth = 4
o.tabstop = 4
o.softtabstop = 4
o.foldmethod = "expr"
o.foldexpr = "nvim_treesitter#foldexpr()"
o.foldlevel = 20
o.foldcolumn = "1"
o.number = true
o.relativenumber = true

-- o.cursorlineopt ='both' -- to enable cursorline!
