return {
    "tpope/vim-fugitive",
    dependencies = {
        "sindrets/diffview.nvim",
    },
    config = function()
        -- Similar keybinding to what was used with Neogit
        vim.keymap.set("n", "<leader>gs", vim.cmd.Git)

        -- Additional useful Fugitive bindings
        vim.keymap.set("n", "<leader>gc", function()
            vim.cmd("Git commit")
        end)

        vim.keymap.set("n", "<leader>gp", function()
            vim.cmd("Git push")
        end)

        vim.keymap.set("n", "<leader>gP", function()
            vim.cmd("Git pull")
        end)
    end
}

