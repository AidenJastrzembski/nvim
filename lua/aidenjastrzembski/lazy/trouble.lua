return {
    {
        "folke/trouble.nvim",
        cmd = "Trouble",
        keys = {
            { "<leader>tt", function() require("trouble").toggle("diagnostics") end, desc = "Toggle Trouble" },
            { "[e", function() require("trouble").prev({ skip_groups = true, jump = true }) end, desc = "Prev error" },
            { "]e", function() require("trouble").next({ skip_groups = true, jump = true }) end, desc = "Next error" },
        },
        config = function()
            require("trouble").setup({
                icons = false,
            })
        end
    },
}
