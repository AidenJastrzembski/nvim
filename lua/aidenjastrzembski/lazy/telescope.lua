---@diagnostic disable: undefined-global
return {
    "nvim-telescope/telescope.nvim",

    branch = "master",

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
                require('telescope.builtin').live_grep()
            end, desc = 'Telescope live grep' },
            { '<leader>vh', builtin('help_tags'), desc = 'Telescope help tags' },
            { '<leader>b', builtin('buffers'), desc = 'Telescope buffers' },
            { '<leader>/', builtin('current_buffer_fuzzy_find'), desc = 'Fuzzy find in buffer' },
            { '<leader>sd', builtin('diagnostics'), desc = 'Search diagnostics' },
        }
    end,

    config = function()
        require('telescope').setup({
            defaults = {
                file_ignore_patterns = { "node_modules", ".git/", "target/", "zig%-out/" },
                layout_config = {
                    prompt_position = "top",
                },
                sorting_strategy = "ascending",
            },
        })
    end
}
