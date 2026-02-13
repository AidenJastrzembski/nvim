---@diagnostic disable: undefined-global
return {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
        "MunifTanjim/nui.nvim",
        {
            "rcarriga/nvim-notify",
            opts = {
                stages = "fade_in_slide_out",
                timeout = 2000,
                render = "compact",
            },
            config = function(_, opts)
                local notify = require("notify")
                notify.setup(opts)
                vim.notify = notify
            end,
        },
    },
    opts = {
        presets = {
            bottom_search = true,
            command_palette = true,
            long_message_to_split = true,
            lsp_doc_border = true,
        },
    },
    keys = {
        { "<leader>sn", function() require("noice").cmd("telescope") end, desc = "Notifications (Telescope)" },
        { "<leader>sm", function() require("noice").cmd("history") end,   desc = "Message history" },
        { "<leader>sd", function() require("noice").cmd("dismiss") end,   desc = "Dismiss all" },
    },
}
