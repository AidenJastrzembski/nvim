return {
    "forest-nvim/maple.nvim",
    name = "maple",
    priority = 1000,
    lazy = false,
    opts = {},
    keys = {
        { '<leader>mt', '<cmd>MapleToggle<CR>',         desc = 'Toggle Maple Notes' },
        { '<leader>mv', '<cmd>MapleToggleVsplit<CR>',   desc = 'Toggle Maple Vertical Split' },
        { '<leader>mh', '<cmd>MapleToggleSplit<CR>',    desc = 'Toggle Maple Horizontal Split' },
        { '<leader>mb', '<cmd>MapleToggleBuffer<CR>',   desc = 'Toggle Maple Full Buffer' },
        { '<leader>ms', '<cmd>MapleSwitchMode<CR>',     desc = 'Switch notes mode' },
        { '<leader>mc', '<cmd>MapleToggleCheckbox<CR>', desc = 'Toggle checkbox' },
        { '<leader>ma', '<cmd>MapleAddCheckbox<CR>',    desc = 'Add checkbox' },
        { '<leader>mf', '<cmd>MapleSearch<CR>',         desc = 'Search notes' },
        { '<leader>mg', '<cmd>MapleSearch grep<CR>',    desc = 'Grep notes' },
    },
}
