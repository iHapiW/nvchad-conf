local options = {
    preview = {
        quit = "q",
        accept = "<CR>",
    },
    header_extension = "hpp",
    source_extension = "cpp",
}

local map = vim.keymap.set
map("n", "<Leader>wd", ":TSCppDefineClassFunc<CR>", { desc = "Generate Class Function Definition" })
map("v", "<Leader>wd", ":TSCppDefineClassFunc<CR>", { desc = "Generate Class Function Definition" })

return options
