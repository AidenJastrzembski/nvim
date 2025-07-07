return {
    {
        "toppair/peek.nvim",
        event = { "VeryLazy" },
        build = "deno task --quiet build:fast",
        config = function()
            require("peek").setup({
                filetype = { 'markdown', 'conf' },
                close_on_bdelete = true,
            })
            vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
            vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})

            vim.api.nvim_set_keymap("n", "<leader>po", ":PeekOpen<CR>", { noremap = true, silent = true })
            vim.api.nvim_set_keymap("n", "<leader>pc", ":PeekClose<CR>", { noremap = true, silent = true })
        end,

    },
}
