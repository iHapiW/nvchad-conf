return {
    -- Syntax Highlighting
    {
        "nvim-treesitter/nvim-treesitter",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require("configs.treesitter")
        end,
    },

    -- LSP Support
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require("nvchad.configs.lspconfig").defaults()
            require("configs.lspconfig")
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        event = "VeryLazy",
        dependencies = { "nvim-lspconfig" },
        config = function()
            require("configs.mason-lspconfig")
        end,
    },

    -- Linting
    {
        "mfussenegger/nvim-lint",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require("configs.lint")
        end,
    },
    {
        "rshkarin/mason-nvim-lint",
        event = "VeryLazy",
        dependencies = { "nvim-lint" },
        config = function()
            require("configs.mason-lint")
        end,
    },

    -- Formatting
    {
        "stevearc/conform.nvim",
        event = "BufWritePre", -- Comment to not format on save
        opts = require("configs.conform"),
    },
    {
        "zapling/mason-conform.nvim",
        event = "VeryLazy",
        dependencies = "conform.nvim",
        config = function()
            require("configs.mason-conform")
        end,
    },

    -- Tmux-Neovim Navigation
    {
        "christoomey/vim-tmux-navigator",
        lazy = false,
    },
}
