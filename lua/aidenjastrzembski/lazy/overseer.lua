return {
    "stevearc/overseer.nvim",
    dependencies = { "stevearc/dressing.nvim" },
    cmd = { "OverseerRun", "OverseerToggle", "OverseerInfo" },
    keys = {
        { "<leader>or", "<cmd>OverseerRun<cr>",    desc = "Run task" },
        { "<leader>ot", "<cmd>OverseerToggle<cr>", desc = "Toggle task list" },
    },
    opts = {
        task_list = {
            direction = "bottom",
            min_height = 15,
            default_detail = 1,
        },
        templates = { "builtin", "cargo" },
    },
    config = function(_, opts)
        local overseer = require("overseer")
        overseer.setup(opts)

        local TAG = require("overseer.constants").TAG
        local condition = {
            callback = function()
                return vim.fn.executable("zig") == 1
                    and vim.fs.find("build.zig", { upward = true, type = "file" })[1] ~= nil
            end,
        }

        overseer.register_template({
            name = "zig build",
            tags = { TAG.BUILD },
            condition = condition,
            builder = function()
                return { cmd = { "zig", "build" } }
            end,
        })

        overseer.register_template({
            name = "zig build run",
            tags = { TAG.RUN },
            condition = condition,
            builder = function()
                return { cmd = { "zig", "build", "run" } }
            end,
        })

        overseer.register_template({
            name = "zig build test",
            tags = { TAG.TEST },
            condition = condition,
            builder = function()
                return { cmd = { "zig", "build", "test" } }
            end,
        })

        overseer.register_template({
            name = "zig test current file",
            tags = { TAG.TEST },
            condition = { filetype = "zig" },
            builder = function()
                return { cmd = { "zig", "test", vim.fs.normalize(vim.api.nvim_buf_get_name(0)) } }
            end,
        })
    end,
}
