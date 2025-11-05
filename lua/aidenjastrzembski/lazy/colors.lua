---@diagnostic disable: undefined-global
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
        priority = 1000,
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
        priority = 1000,
        opts = {},
        config = function()
            ColorMyPencils("tokyonight-night")
        end
    },
    {
        "shaunsingh/nord.nvim",
        name = "nord",
    },
    {
        "sainnhe/everforest",
        name = "everforest",
    },

    {
        "aditya-azad/candle-grey",
        name = "candle-grey",
    },
    {
        "navarasu/onedark.nvim",
        priority = 1000,
        config = function()
            require('onedark').setup {}
        end
    },
    {
        "rebelot/kanagawa.nvim",
        name = "kanagawa",
    }

}
