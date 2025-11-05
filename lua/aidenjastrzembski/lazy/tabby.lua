---@diagnostic disable: undefined-global
return {
    "nanozuki/tabby.nvim",
    event = "VeryLazy",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    keys = {
        { "<leader>tn", function() vim.cmd.tabnew() end,                    desc = "New tab" },
        { "<leader>ts", function() vim.cmd("tab split") end,               desc = "Tab split current buffer" },
        { "<leader>tc", function() vim.cmd.tabclose() end,                  desc = "Close tab" },
        { "<leader>to", function() vim.cmd("tabonly") end,                 desc = "Close other tabs" },
        { "<leader>tl", function() vim.cmd.tabnext() end,                   desc = "Next tab" },
        { "<leader>th", function() vim.cmd.tabprevious() end,               desc = "Prev tab" },
        { "<leader>tL", function() vim.cmd("tabmove +1") end,              desc = "Move tab right" },
        { "<leader>tH", function() vim.cmd("tabmove -1") end,              desc = "Move tab left" },
        { "<leader>tj", "<cmd>Tabby jump_to_tab<CR>",                       desc = "Jump mode (pick tab)" },
    },
    config = function()
        -- Use a preset tabline; wrap in pcall to avoid errors if APIs change
        local ok, tabline = pcall(require, "tabby.tabline")
        if ok and tabline and tabline.use_preset then
            pcall(tabline.use_preset, "active_wins_at_tail", { nerdfont = true })
        end
    end,
}


