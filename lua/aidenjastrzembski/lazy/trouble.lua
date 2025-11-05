return {
    {
        "folke/trouble.nvim",
        cmd = { "Trouble", "TroubleToggle", "TroubleClose", "TroubleRefresh" },
        keys = {
            { "<leader>tt", function() require("trouble").toggle() end, desc = "Toggle Trouble" },
            { "[t", function() require("trouble").next({skip_groups = true, jump = true}) end, desc = "Next trouble" },
            { "]t", function() require("trouble").previous({skip_groups = true, jump = true}) end, desc = "Prev trouble" },
        },
        config = function()
            require("trouble").setup({
                icons = false,
            })
        end
    },
}
