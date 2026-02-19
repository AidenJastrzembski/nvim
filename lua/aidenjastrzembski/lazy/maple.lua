return {
    "forest-nvim/maple.nvim",
    name = "maple",
    priority = 1000,
    lazy = false,
    opts = {},
    keys = {
        { '<leader>mt', '<cmd>MapleToggle<CR>',         desc = 'Toggle Maple Notes' },
        { '<leader>ms', '<cmd>MapleSwitchMode<CR>',     desc = 'Switch notes mode' },
        { '<leader>mc', '<cmd>MapleToggleCheckbox<CR>', desc = 'Toggle checkbox' },
        { '<leader>ma', '<cmd>MapleAddCheckbox<CR>',    desc = 'Add checkbox' },
        { '<leader>mf', '<cmd>MapleSearch<CR>',         desc = 'Search notes' },
        { '<leader>mg', '<cmd>MapleSearch grep<CR>',    desc = 'Grep notes' },
    },
}
