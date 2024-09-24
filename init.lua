vim.g.base46_cache = vim.fn.stdpath("data") .. "/nvchad/base46/"
vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
    local repo = "https://github.com/folke/lazy.nvim.git"
    vim.fn.system({ "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath })
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require("configs.lazy")

-- load plugins
require("lazy").setup({
    {
        "NvChad/NvChad",
        lazy = false,
        branch = "v2.5",
        import = "nvchad.plugins",
    },

    { import = "plugins" },
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require("options")
require("nvchad.autocmds")

vim.schedule(function()
    require("mappings")
end)

-- My Personal Configurations

-- Assembly filetype detection
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    pattern = { "*.s", "*.S", "*.nasm", "*.asm" },
    callback = function()
        vim.bo.filetype = "nasm"
    end,
})

-- Suppress vim.treesitter.get_parser warning for neovim 0.12
local original_notify = vim.notify

vim.notify = function(msg, level, opts)
    if msg:match("vim.treesitter.get_parser will return nil instead of raising an error") then
        return
    end
    return original_notify(msg, level, opts)
end
