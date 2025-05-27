return {
    "Exafunction/windsurf.vim",
    config = function()
        vim.g.codeium_disable_telemetry = true
        vim.g.codeium_disable_bindings = true

        local keymap = vim.keymap.set
        local fn = vim.fn

        keymap('i', '<C-j>', function() return fn['codeium#Accept']() end, { expr = true, silent = true })
        keymap('i', '<C-;>', function() return fn end, { expr = true, silent = true })
        keymap('i', '<C-,>', function() return fn['codeium#CycleCompletions'](-1) end, { expr = true, silent = true })
        keymap('i', '<C-x>', function() return fn['codeium#Clear']() end, { expr = true, silent = true })
        keymap('i', '<C-Space>', function() return fn['codeium#Complete']() end, { expr = true, silent = true })
    end
}
