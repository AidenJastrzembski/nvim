return {
    "goolord/alpha-nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        local alpha = require("alpha")
        local dashboard = require("alpha.themes.dashboard")

        dashboard.section.header.val = {
            [[          __                ]],
            [[  __  __ /\_\    ___ ___    ]],
            [[ /\ \/\ \\/\ \  / __` __`\  ]],
            [[ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
            [[  \ \___/  \ \_\ \_\ \_\ \_\]],
            [[   \/__/    \/_/\/_/\/_/\/_/]],
            [[                            ]],
            [[    - Aiden Jastrzembski    ]],
        }

        dashboard.section.buttons.val = {
            dashboard.button("e", "     New file", ":ene <BAR> startinsert <CR>"),
            dashboard.button("f", "ff    Find file", ":Telescope find_files <CR>"),
            dashboard.button("r", "     Recent files", ":Telescope oldfiles <CR>"),
            dashboard.button("t", "pws   Find text", ":Telescope live_grep <CR>"),
            dashboard.button("c", "     Configuration", ":e $MYVIMRC <CR>"),
            dashboard.button("q", ":q    Quit Vim", ":qa<CR>"),
        }

        local function footer()
            local datetime = os.date(" %d-%m-%Y   %H:%M:%S")
            local plugins_text = "⚡ Neovim loaded "
                .. #vim.tbl_keys(package.loaded)
                .. " plugins"
            return datetime .. "  |  " .. plugins_text
        end

        dashboard.section.footer.val = footer()

        dashboard.section.footer.opts.hl = "Type"
        dashboard.section.header.opts.hl = "Include"
        dashboard.section.buttons.opts.hl = "Keyword"

        dashboard.opts.opts.noautocmd = true
        alpha.setup(dashboard.opts)

        vim.api.nvim_create_autocmd("User", {
            pattern = "LazyVimStarted",
            callback = function()
                local stats = require("lazy").stats()
                local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
                dashboard.section.footer.val = footer() .. "  |  ⚡ Loaded in " .. ms .. "ms"
                pcall(vim.cmd.AlphaRedraw)
            end,
        })
    end,
}
