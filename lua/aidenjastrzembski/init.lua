-- Compatibility shim for plugins still calling deprecated vim.tbl_islist.
if vim.islist and vim.tbl_islist ~= vim.islist then
    vim.tbl_islist = vim.islist
end

require("aidenjastrzembski.set")
require("aidenjastrzembski.remap")
require("aidenjastrzembski.lazy_init")

local augroup = vim.api.nvim_create_augroup
local AidenJastrzembskiGroup = augroup('AidenJastrzembski', {})

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup('HighlightYank', {})

vim.filetype.add({
    extension = {
        templ = 'templ',
    }
})

autocmd('TextYankPost', {
    group = yank_group,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 40,
        })
    end,
})

autocmd({ "BufWritePre" }, {
    group = AidenJastrzembskiGroup,
    pattern = "*",
    command = [[%s/\s\+$//e]],
})
