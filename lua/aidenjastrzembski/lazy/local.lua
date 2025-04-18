local local_plugins = {
    {
        "vim-guys",
        dir = "~/personal/vim-guys",
        config = function()
        end,
    },
    {
        "cockpit",
        dir = "~/personal/cockpit",
        config = function()
            require("cockpit")
            vim.keymap.set("n", "<leader>ct", "<cmd>CockpitTest<CR>")
            vim.keymap.set("n", "<leader>cr", "<cmd>CockpitRefresh<CR>")
        end,
    },
    {
        "github/copilot.vim",
        config = function()
            vim.g.copilot_no_tab_map = true
            vim.g.copilot_assume_mapped = true
            vim.g.copilot_tab_fallback = ""
            vim.keymap.set('i', '<C-J>', 'copilot#Accept("\\<CR>")', {
                expr = true,
                replace_keycodes = false
            })
            vim.g.copilot_filetypes = {
                ["*"] = true,
            }
        end,
    },
    {
        "caleb",
        dir = "~/personal/caleb",
        config = function() end
    },
    {
        "vim-apm", dir = "~/personal/vim-apm",
        config = function()
            --[[
            local apm = require("vim-apm")

            apm:setup({})
            vim.keymap.set("n", "<leader>apm", function() apm:toggle_monitor() end)
            --]]
        end
    },
    {
        "vim-with-me", dir = "~/personal/vim-with-me",
        config = function() end
    },
}

return local_plugins

