local dap = require("dap")
local map = vim.keymap.set

map("n", "<Leader>db", "<cmd> DapToggleBreakpoint <CR>", { desc = "Toggle DAP Breakpoint" })
map("n", "<Leader>dr", "<cmd> DapContinue <CR>", { desc = "Start or Continue DAP" })
map("n", "<Leader>dn", "<cmd> DapStepOver <CR>", { desc = "Step Over DAP" })
map("n", "<Leader>ds", "<cmd> DapStepInto <CR>", { desc = "Step Into DAP" })
map("n", "<Leader>df", "<cmd> DapStepOut <CR>", { desc = "Step Out DAP" })
map("n", "<Leader>dq", "<cmd> DapTerminate <CR>", { desc = "Terminate DAP" })

-- C/C++
dap.adapters.cppdbg = {
    id = "cppdbg",
    type = "executable",
    command = "/home/ihapiw/.local/share/nvim/mason/packages/cpptools/extension/debugAdapters/bin/OpenDebugAD7",
}

dap.configurations.cpp = {
    {
        name = "Launch file",
        type = "cppdbg",
        request = "launch",
        program = function()
            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
        end,
        cwd = "${workspaceFolder}",
        stopAtEntry = true,
    },
    -- {
    --     name = "Attach to gdbserver :1234",
    --     type = "cppdbg",
    --     request = "launch",
    --     MIMode = "gdb",
    --     miDebuggerServerAddress = "localhost:1234",
    --     miDebuggerPath = "/usr/bin/gdb",
    --     cwd = "${workspaceFolder}",
    --     program = function()
    --         return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
    --     end,
    -- },
}

dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp
