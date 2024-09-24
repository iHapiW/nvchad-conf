local builtin = require("statuscol.builtin")
require("statuscol").setup({
    relculright = false,
    segments = {
        {
            text = { " ", builtin.lnumfunc, " " },
            click = "v:lua.ScLa",
        },
        {
            text = { builtin.foldfunc, " " },
            click = "v:lua.ScFa",
        },
        {
            sign = {
                name = { ".*" },
                maxwidth = 2,
                colwidth = 1,
                auto = true,
                wrap = true,
            },
            click = "v:lua.ScSa",
        },
    },
})
