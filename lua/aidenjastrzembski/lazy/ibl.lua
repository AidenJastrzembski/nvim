---@diagnostic disable: undefined-global
return {
    {
        "lukas-reineke/indent-blankline.nvim",
        lazy = true,
        event = "BufRead",
        main = "ibl",
        ---@module "ibl"
        opts = {
            indent = {
                char = "│",
                tab_char = "│",
            },
            scope = {
                enabled = false,
            },
            exclude = {
                filetypes = {
                    "Trouble",
                    "alpha",
                    "dashboard",
                    "help",
                    "lazy",
                    "mason",
                    "neo-tree",
                    "notify",
                    "snacks_dashboard",
                    "snacks_notif",
                    "snacks_terminal",
                    "snacks_win",
                    "toggleterm",
                    "trouble",
                },
            },
        },
    }
}


