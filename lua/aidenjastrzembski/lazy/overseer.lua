return {
    "stevearc/overseer.nvim",
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
}
