return {
    -- Syntax Highlighting
    {
        "nvim-treesitter/nvim-treesitter",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require("configs.treesitter")
        end,
    },

    -- UFO & statuscol for folding
    {
        "kevinhwang91/nvim-ufo",
        dependencies = "kevinhwang91/promise-async",
        event = "BufReadPost",
        config = function()
            require("configs.ufo")
        end,
    },
    {
        "luukvbaal/statuscol.nvim",
        event = "VeryLazy",
        config = function()
            require("configs.statuscol")
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

    -- Debugging
    {
        "mfussenegger/nvim-dap",
        config = function()
            require("configs.dap")
        end,
    },
    {
        "nvim-neotest/nvim-nio",
    },
    {
        "rcarriga/nvim-dap-ui",
        lazy = false,
        dependencies = {
            "mfussenegger/nvim-dap",
            "nvim-neotest/nvim-nio",
        },
        config = function()
            require("configs.dap-ui")
        end,
    },
    {
        "jay-babu/mason-nvim-dap.nvim",
        event = "VeryLazy",
        config = function()
            require("configs.mason-dap")
        end,
    },
    {
        "mfussenegger/nvim-dap-python",
        ft = "python",
        dependencies = {
            "mfussenegger/nvim-dap",
            "rcarriga/nvim-dap-ui",
        },
        config = function()
            require("configs.dap-python")
        end,
    },

    -- Tmux-Neovim Navigation
    {
        "christoomey/vim-tmux-navigator",
        lazy = false,
    },

    -- C++ Tools
    {
        "Badhi/nvim-treesitter-cpp-tools",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        ft = "cpp",
        opts = function()
            return require("configs.cpp-tools")
        end,
        config = true,
    },
}
