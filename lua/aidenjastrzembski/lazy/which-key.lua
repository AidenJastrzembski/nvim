return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
        spec = {
            { "<leader>v", group = "lsp" },
            { "<leader>h", group = "git hunk" },
            { "<leader>p", group = "search" },
            { "<leader>s", group = "search" },
            { "<leader>t", group = "tabs" },
            { "<leader>z", group = "zen" },
        },
    },
}
