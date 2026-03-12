function Colo(color)
    color = color or "rose-pine-moon"
    vim.cmd.colorscheme(color)

    local transparent = { bg = "none" }
    local groups = {
        "Normal",
        "NormalNC",
        "NormalFloat",
        "SignColumn",
        "WinSeparator",
    }
    for _, group in ipairs(groups) do
        vim.api.nvim_set_hl(0, group, transparent)
    end

    vim.opt.colorcolumn = ""
    vim.api.nvim_set_hl(0, "LspInlayHint", {
        fg = "#a0a0a0",
        bg = "NONE",
        italic = true,
    })
    -- rust-analyzer marks proc-macro-generated items as "unresolvedReference"
    -- even when they compile fine — clear the false-positive highlight
    vim.api.nvim_set_hl(0, "@lsp.type.unresolvedReference", {})
end

return {
    {
        "forest-nvim/sequoia.nvim",
        name = "sequoia",
        priority = 1000,
    },
    {
        "rose-pine/neovim",
        name = "rose-pine",
        priority = 1000,
        lazy = false,
        config = function()
            Colo("rose-pine-moon")
        end,
    },
    {
        "vague2k/vague.nvim",
        name = "vague",
        priority = 1000,
    },
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
    },
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
    },
    {
        "rebelot/kanagawa.nvim",
        name = "kanagawa",
        priority = 1000,
    },
    {
        "dgox16/oldworld.nvim",
        name = "oldworld",
        priority = 1000,
    }
}
