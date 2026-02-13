return {
    "folke/zen-mode.nvim",
    dependencies = { "folke/twilight.nvim" },
    keys = {
        { "<leader>zz", "<cmd>ZenMode<CR>", desc = "Zen Mode" },
    },
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
    end,
}
