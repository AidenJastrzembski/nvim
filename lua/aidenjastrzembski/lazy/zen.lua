return {
    "folke/zen-mode.nvim",
    dependencies = { "folke/twilight.nvim" },
    config = function()
        require("zen-mode").setup {
            window = {
                width = .8,
            },
            plugins = {
                twilight = { enabled = true },
                gitsigns = { enabled = false },
                tmux = { enabled = false },
            },
        }
        vim.api.nvim_set_keymap("n", "<leader>zz", ":ZenMode<CR>", { noremap = true, silent = true })
    end,
}
