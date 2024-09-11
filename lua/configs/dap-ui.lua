local dapui = require("dapui")
local dap = require("dap")

dapui.setup()

local map = vim.keymap.set
map("n", "<Leader>du", "<cmd> lua require('dapui').toggle()<CR>", { desc = "Toggle DAP UI" })

dap.listeners.before.attach.dapui_config = function()
    dapui.open()
end

dap.listeners.before.launch.dapui_config = function()
    dapui.open()
end

dap.listeners.before.event_terminated.dapui_config = function()
    dapui.close()
end

dap.listeners.before.event_exited.dapui_config = function()
    dapui.close()
end
