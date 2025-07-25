return {
    "Exafunction/windsurf.vim",
    config = function()
        vim.g.codeium_disable_telemetry = true
        vim.g.codeium_no_map_tab = true

        local fn = vim.fn

        vim.keymap.set('i', '<C-j>', function() return fn['codeium#Accept']() end, { expr = true, silent = true })
    end
}
