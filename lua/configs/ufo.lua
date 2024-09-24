local map = vim.keymap.set
local o = vim.o

require("ufo").setup({
    provider_selector = function(bufnr, filetype, buftype)
        return { "lsp", "indent" }
    end,
})

map("n", "zR", require("ufo").openAllFolds)
map("n", "zM", require("ufo").closeAllFolds)
map("n", "zr", require("ufo").openFoldsExceptKinds)
map("n", "zm", require("ufo").closeFoldsWith)
map("n", "<Enter>", "za", { noremap = true, silent = true })
map("n", "K", function()
    local winid = require("ufo").peekFoldedLinesUnderCursor()
    if not winid then
        -- choose one of coc.nvim and nvim lsp
        vim.lsp.buf.hover()
    end
end)

-- Folding Configuration
o.foldlevel = 99
o.foldcolumn = "1"
vim.opt.fillchars = {
    fold = " ",
    foldopen = "▾",
    foldclose = "▸",
    foldsep = " ",
    eob = " ",
}

vim.cmd([[highlight FoldColumn guifg=#56b6c2 guibg=NONE]])
