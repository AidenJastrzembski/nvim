---@diagnostic disable: undefined-global
return {
    "RRethy/vim-illuminate",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
        require("illuminate").configure({
            providers = {
                "lsp",
                "treesitter",
                "regex",
            },
            delay = 120,
            filetypes_denylist = {
                "alpha",
                "lazy",
                "oil",
                "TelescopePrompt",
            },
        })

        vim.keymap.set("n", "]r", function()
            require("illuminate").goto_next_reference(false)
        end, { desc = "Next reference" })
        vim.keymap.set("n", "[r", function()
            require("illuminate").goto_prev_reference(false)
        end, { desc = "Prev reference" })
    end,
}
