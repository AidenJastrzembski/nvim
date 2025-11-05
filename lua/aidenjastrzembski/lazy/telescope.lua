---@diagnostic disable: undefined-global
return {
    "nvim-telescope/telescope.nvim",

    tag = "0.1.5",

    dependencies = {
        "nvim-lua/plenary.nvim"
    },

    cmd = "Telescope",
    keys = function()
        local builtin = function(name)
            return function()
                require('telescope.builtin')[name]()
            end
        end
        return {
            { '<leader>f', builtin('find_files'), desc = 'Telescope find files' },
            { '<C-p>', builtin('git_status'), desc = 'Telescope git status' },
            { '<leader>pws', function()
                local word = vim.fn.expand("<cword>")
                require('telescope.builtin').grep_string({ search = word })
            end, desc = 'Telescope grep cword' },
            { '<leader>pWs', function()
                local word = vim.fn.expand("<cWORD>")
                require('telescope.builtin').grep_string({ search = word })
            end, desc = 'Telescope grep cWORD' },
            { '<leader>ps', function()
                require('telescope.builtin').live_grep({ search = "" })
            end, desc = 'Telescope live grep' },
            { '<leader>vh', builtin('help_tags'), desc = 'Telescope help tags' },
        }
    end,

    config = function()
        require('telescope').setup({})
    end
}
