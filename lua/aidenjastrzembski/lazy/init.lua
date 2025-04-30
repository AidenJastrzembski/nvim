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
}
