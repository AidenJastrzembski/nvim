return {
    dir = "~/code/personal/forest/bonsai.nvim",
    config = function()
        -- Main toggle
        vim.keymap.set("n", "<leader>zz", function()
            require("bonsai").setup {}
            require("bonsai").toggle()
            ColorMyPencils()
        end)

        -- Set up all Bonsai keymaps
        require("bonsai").setup({
            keymaps = {
                narrow = "<leader>zn",     -- Narrow mode toggle
                focus = "<leader>zf",      -- Focus mode toggle
                minimalist = "<leader>zm", -- Minimalist mode toggle
                ataraxis = "<leader>za"    -- Ataraxis (zen) mode toggle
            }
        })
    end
}

