local lint = require("lint")

lint.linters_by_ft = {
    lua = { "luacheck" },
    python = { "flake8" },
}

lint.linters.luacheck.args = {
    "--globals",
    "vim",
    "--formatter",
    "plain",
    "--codes",
    "--ranges",
    "-",
}

lint.linters.flake8.args = {
    "--extend-ignore",
    "E203,E701",
}

vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
    callback = function()
        lint.try_lint()
    end,
})
