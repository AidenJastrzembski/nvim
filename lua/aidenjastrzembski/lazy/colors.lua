function ColorMyPencils(color)
    color = color or "sequoia"
    vim.cmd.colorscheme(color)

    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    vim.opt.colorcolumn = "" --disable the line for style guidance (its ugly)
end

return {
    {
        "forest-nvim/sequoia.nvim",
        name = "sequoia",
        lazy = false,
        priority = 1000,
        config = function()
            ColorMyPencils()
        end
    },
    {
        "rose-pine/neovim",
        name = "rose-pine",
        config = function()
            require('rose-pine').setup({
                styles = {
                    italic = false,
                },
            })

            ColorMyPencils();
        end
    },
    {
        "vague2k/vague.nvim",
        config = function()
            require("vague").setup({})
        end
    },
    {
        "folke/tokyonight.nvim",
        lazy = false,
        opts = {},
        config = function()
            ColorMyPencils()
        end
    },
    {
        "ellisonleao/gruvbox.nvim",
        name = "gruvbox",
        config = function()
            require("gruvbox").setup({
                terminal_colors = true, -- add neovim terminal colors
                undercurl = true,
                underline = false,
                bold = true,
                italic = {
                    strings = false,
                    emphasis = false,
                    comments = false,
                    operators = false,
                    folds = false,
                },
                strikethrough = true,
                invert_selection = false,
                invert_signs = false,
                invert_tabline = false,
                invert_intend_guides = false,
                inverse = true, -- invert background for search, diffs, statuslines and errors
                contrast = "",  -- can be "hard", "soft" or empty string
                palette_overrides = {},
                overrides = {},
                dim_inactive = false,
                transparent_mode = false,
            })
        end,
    },
    {
        "shaunsingh/nord.nvim",
        name = "nord",
        config = function()
            ColorMyPencils()
        end
    },
    {
        "sainnhe/everforest",
        name = "everforest",
        config = function()
            ColorMyPencils()
        end
    },

    {
        "aditya-azad/candle-grey",
        name = "candle-grey",
        config = function()
            ColorMyPencils()
        end
    },

}
