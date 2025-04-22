return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "VeryLazy",
    config = function()
        require('lualine').setup {
            options = {
                icons_enabled = true,
                theme = 'rose-pine-moon', -- or 'catppuccin', 'tokyonight', etc.
                section_separators = { left = '', right = '' },
                component_separators = { left = '', right = '' },
                globalstatus = true,
                disabled_filetypes = { 'NvimTree', 'neo-tree' },
            },
            sections = {
                lualine_a = { 'mode' },
                lualine_b = { 'branch' },
                lualine_c = { { 'filename', path = 1 } }, -- smart path
                lualine_x = { 'filetype' },
                lualine_y = { 'progress' },
                lualine_z = { 'location' },
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = { { 'filename', path = 1 } },
                lualine_x = { 'location' },
                lualine_y = {},
                lualine_z = {}
            },
            tabline = {},
            winbar = {},
            inactive_winbar = {},
            extensions = {}
        }
    end
}
