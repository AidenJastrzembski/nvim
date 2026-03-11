return {
    "Exafunction/windsurf.vim",
    config = function()
        local hostname = vim.uv.os_gethostname()

        if hostname == "work-mac" then
            vim.g.codeium_disable_telemetry = true
            vim.g.codeium_no_map_tab = true

            local fn = vim.fn

            vim.keymap.set('i', '<C-j>', function() return fn['codeium#Accept']() end, { expr = true, silent = true })
        else
            -- NO STINKY AI IN MY PERSONAL LIFE
        end
    end
}
