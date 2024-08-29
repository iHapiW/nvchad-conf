local options = {
    ensure_installed = {
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
