return {
    {
        "folke/trouble.nvim",
        cmd = "Trouble",
        keys = {
            { "<leader>tt", function() require("trouble").toggle("diagnostics") end, desc = "Toggle Trouble" },
            { "[d", function() require("trouble").prev({ skip_groups = true, jump = true }) end, desc = "Prev diagnostic" },
            { "]d", function() require("trouble").next({ skip_groups = true, jump = true }) end, desc = "Next diagnostic" },
        },
        config = function()
            require("trouble").setup({
                icons = false,
            })
        end
    },
}
