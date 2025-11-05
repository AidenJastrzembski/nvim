---@diagnostic disable: undefined-global
return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
        local wk = require("which-key")
        wk.setup({})
        -- Register groups for discoverability
        if wk.add then
            wk.add({
                { "<leader>t", group = "tabs" },
                { "<leader>s", group = "noice" },
                { "<leader>h", group = "git (hunks)" },
            })
        else
            wk.register({
                ["<leader>t"] = { name = "+tabs" },
                ["<leader>s"] = { name = "+noice" },
                ["<leader>h"] = { name = "+git (hunks)" },
            })
        end
    end,
}
