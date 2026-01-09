---@diagnostic disable: undefined-global
require("aidenjastrzembski.set")
require("aidenjastrzembski.remap")
require("aidenjastrzembski.lazy_init")


local augroup = vim.api.nvim_create_augroup
local AidenJastrzembskiGroup = augroup('AidenJastrzembski', {})

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup('HighlightYank', {})

function R(name)
    require("plenary.reload").reload_module(name)
end

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

autocmd('VimEnter', {
    group = AidenJastrzembskiGroup,
    callback = function()
        if vim.bo.filetype == "zig()" then
            ColorMyPencils("rose-pine-moon")
        end
        ColorMyPencils("tokyonight-night")
    end
})

autocmd('LspAttach', {
    group = AidenJastrzembskiGroup,
    callback = function(e)
        local opts = { buffer = e.buf }
        local map = vim.keymap.set

        -- Navigation
        map("n", "gd", vim.lsp.buf.definition, opts)
        map("n", "gr", vim.lsp.buf.references, opts)
        map("n", "K", vim.lsp.buf.hover, opts)

        -- Actions
        map("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
        map("n", "<leader>vca", vim.lsp.buf.code_action, opts)
        map("n", "<leader>vrn", vim.lsp.buf.rename, opts)
        map("i", "<C-h>", vim.lsp.buf.signature_help, opts)

        -- Diagnostics
        map("n", "<leader>vd", vim.diagnostic.open_float, opts)
        map("n", "[d", vim.diagnostic.goto_prev, opts)
        map("n", "]d", vim.diagnostic.goto_next, opts)

        -- Inlay hints
        local client = vim.lsp.get_client_by_id(e.data.client_id)
        if client and client.supports_method("textDocument/inlayHint") then
            vim.lsp.inlay_hint.enable(true, { bufnr = e.buf })
        end
    end,
})

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
