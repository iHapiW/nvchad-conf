local options = {
    ensure_installed = {
        "arduino",
        "bash",
        "c",
        "cmake",
        "cpp",
        "javascript",
        "java",
        "lua",
        "luadoc",
        "make",
        "markdown",
        "nasm",
        "printf",
        "python",
        "rust",
        "toml",
        "vim",
        "vimdoc",
        "yaml",
    },

    highlight = {
        enable = true,
        use_languagetree = true,
    },
    indent = { enable = true },
}

require("nvim-treesitter.configs").setup(options)

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    pattern = { "*.html", "*.htm", "*.jinja", "*.jinja2", "*.j2" },
    callback = function()
        vim.bo.filetype = "html" -- Set filetype to HTML for syntax highlighting
    end,
})
