return {
    "mrcjkb/rustaceanvim",
    version = "^6",
    lazy = false,
    dependencies = {
        "mfussenegger/nvim-dap",
        {
            "rcarriga/nvim-dap-ui",
            dependencies = { "nvim-neotest/nvim-nio" },
            config = function()
                local dap, dapui = require("dap"), require("dapui")
                dapui.setup()
                dap.listeners.after.event_initialized["dapui_config"] = function() dapui.open() end
                dap.listeners.before.event_terminated["dapui_config"] = function() dapui.close() end
                dap.listeners.before.event_exited["dapui_config"] = function() dapui.close() end
            end,
        },
    },
    init = function()
        vim.api.nvim_create_autocmd("FileType", {
            group = vim.api.nvim_create_augroup("RustKeymaps", {}),
            pattern = "rust",
            callback = function(e)
                local opts = { buffer = e.buf }
                local map = vim.keymap.set

                map("n", "<leader>rr", function() vim.cmd.RustLsp("runnables") end, opts)
                map("n", "<leader>rd", function() vim.cmd.RustLsp("debuggables") end, opts)
                map("n", "<leader>re", function() vim.cmd.RustLsp("expandMacro") end, opts)
                map("n", "<leader>rp", function() vim.cmd.RustLsp("parentModule") end, opts)
                map("n", "<leader>rc", function() vim.cmd.RustLsp("openCargo") end, opts)
                map("n", "<leader>ra", function() vim.cmd.RustLsp("codeAction") end, opts)
                map("n", "<leader>rx", function() vim.cmd.RustLsp("explainError") end, opts)
                map("n", "<leader>rD", function() vim.cmd.RustLsp("renderDiagnostic") end, opts)
                map("n", "J", function() vim.cmd.RustLsp("joinLines") end, opts)
                map("n", "<leader>lr", "<cmd>RustAnalyzer restart<cr>", opts)
            end,
        })
    end,
}
