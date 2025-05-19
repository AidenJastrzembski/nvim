return {

    {
        "nvim-lua/plenary.nvim",
        name = "plenary"
    },

    {
        "nvim-tree/nvim-web-devicons",
        config = function()
            require("nvim-web-devicons").setup({
                default = true,
                strict = true,
            })
        end
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        lazy = true,
        event = "BufRead",
        main = "ibl",
        ---@module "ibl"
        opts = {
            indent = {
                char = "▏",
                highlight = "LineNr",
            },
            scope = {
                enabled = false,
            },
        },
    }

}
