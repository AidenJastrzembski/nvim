return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
        spec = {
            { "<leader>v", group = "lsp" },
            { "<leader>h", group = "git hunk" },
            { "<leader>p", group = "search" },
            { "<leader>s", group = "notifications" },
            { "<leader>t", group = "tabs" },
            { "<leader>z", group = "zen" },
            { "<leader>r", group = "rust" },
            { "<leader>o", group = "overseer" },
            { "<leader>e", group = "go errors" },
            { "<leader>l", group = "lsp utils" },
        },
    },
}
