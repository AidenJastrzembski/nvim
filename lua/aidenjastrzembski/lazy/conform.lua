return {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    keys = {
        { "<leader>F", function() require("conform").format() end, desc = "Format buffer" },
    },
    opts = {
        formatters_by_ft = {
            lua = { "stylua" },
            typescript = { "prettier" },
            typescriptreact = { "prettier" },
            javascript = { "prettier" },
            javascriptreact = { "prettier" },
            svelte = { "prettier" },
            rust = { "rustfmt" },
            go = { "gofmt" },
            python = { "black" },
        },
        formatters = {
            black = { prepend_args = { "--fast" } },
        },
        format_on_save = {
            timeout_ms = 500,
            lsp_fallback = true,
        },
    },
}
