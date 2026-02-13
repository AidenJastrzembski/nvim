function Colo(color)
    color = color or "sequoia"
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
        config = function()
            require('rose-pine').setup({
                styles = {
                    italic = false,
                },
            })
        end
    },
    {
        "vague2k/vague.nvim",
        config = function()
            require("vague").setup({})
        end
    },
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            Colo("tokyonight-night")
        end
    },
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
    },
    {
        "aditya-azad/candle-grey",
        name = "candle-grey",
    },
    {
        "rebelot/kanagawa.nvim",
        name = "kanagawa",
    },
    {
        "nyoom-engineering/oxocarbon.nvim",
        name = "oxocarbon",
    },
    {
        "EdenEast/nightfox.nvim",
        name = "nightfox",
    }
}
