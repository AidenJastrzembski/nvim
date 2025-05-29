return {
    "NeogitOrg/neogit",
    branch = "nightly",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "sindrets/diffview.nvim",
        "nvim-telescope/telescope.nvim",
    },
    config = function()
        local neogit = require("neogit")
        neogit.setup({
            kind = "split",
            signs = {
                section = { "", "" },
                item = { "", "" },
                hunk = { "", "" },
            },
            integrations = {
                diffview = true,
                telescope = true,
            },
        })

        -- Similar keybinding to what was used with fugitive
        vim.keymap.set("n", "<leader>gs", function()
            neogit.open()
        end)

        -- Additional useful Neogit bindings
        vim.keymap.set("n", "<leader>gc", function()
            neogit.open({ "commit" })
        end)

        vim.keymap.set("n", "<leader>gp", function()
            neogit.open({ "push" })
        end)

        vim.keymap.set("n", "<leader>gP", function()
            neogit.open({ "pull" })
        end)
    end
}
