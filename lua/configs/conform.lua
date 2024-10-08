local options = {
    formatters_by_ft = {
        lua = { "stylua" },
        c = { "clang-format" },
        cpp = { "clang-format" },
        -- python = { "isort", "black" },
        python = { "black" },
        rust = { "rustfmt" },
    },

    formatters = {
        ["clang-format"] = {
            prepend_args = {
                -- Add below to end of list to achieve it
                -- PackConstructorInitializers: Never \
                "-style={ \
                BasedOnStyle: Google, \
                IndentWidth: 4, \
                TabWidth: 4, \
                UseTab: Never, \
                AccessModifierOffset: -4, \
                IndentAccessModifiers: false, \
                }",
                -- AllowShortFunctionsOnASingleLine: Empty, \
            },
        },
        black = {
            prepend_args = {
                "--fast",
                "--line-length",
                "80",
            },
        },
        -- isort = {
        --     prepend_args = {
        --         "--profile",
        --         "black",
        --     },
        -- },
    },

    -- Comment to not format on save
    format_on_save = {
        -- These options will be passed to conform.format()
        timeout_ms = 500,
        lsp_fallback = true,
    },
}

return options
