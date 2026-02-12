return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/nvim-cmp",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
        "j-hui/fidget.nvim",
    },

    config = function()
        local cmp = require("cmp")
        local capabilities = vim.tbl_deep_extend(
            "force",
            vim.lsp.protocol.make_client_capabilities(),
            require("cmp_nvim_lsp").default_capabilities()
        )

        require("fidget").setup()
        require("mason").setup()

        -- Server-specific settings
        local servers = {
            lua_ls = {
                settings = {
                    Lua = {
                        diagnostics = { globals = { "vim" } },
                        workspace = {
                            library = vim.api.nvim_get_runtime_file("", true),
                            checkThirdParty = false,
                        },
                        telemetry = { enable = false },
                    },
                },
            },
            zls = {
                settings = {
                    zls = {
                        enable_inlay_hints = true,
                        enable_snippets = true,
                        warn_style = true,
                        highlight_global_var_declarations = true,
                    },
                },
            },
            rust_analyzer = {
                settings = {
                    ["rust-analyzer"] = {
                        cargo = { allFeatures = true },
                        checkOnSave = { command = "clippy" },
                        inlayHints = {
                            lifetimeElisionHints = { enable = "always" },
                        },
                    },
                },
            },
        }

        require("mason-lspconfig").setup({
            ensure_installed = {
                "rust_analyzer", "clangd", "zls", "gopls", "ts_ls",
                "eslint", "tailwindcss", "pyright", "lua_ls",
            },
            handlers = {
                function(server_name)
                    local config = servers[server_name] or {}
                    config.capabilities = capabilities
                    vim.lsp.config(server_name, config)
                    vim.lsp.enable(server_name)
                end,
            },
        })

        cmp.setup({
            snippet = {
                expand = function(args)
                    require("luasnip").lsp_expand(args.body)
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ["<S-Tab>"] = cmp.mapping.select_prev_item(),
                ["<Tab>"] = cmp.mapping.select_next_item(),
                ["<CR>"] = cmp.mapping.confirm({ select = true }),
                ["<C-p>"] = cmp.mapping.complete(),
            }),
            sources = cmp.config.sources(
                { { name = "nvim_lsp" }, { name = "luasnip" } },
                { { name = "buffer" } }
            ),
        })

        vim.diagnostic.config({
            float = { border = "rounded", source = "always" },
        })

        vim.api.nvim_create_autocmd('LspAttach', {
            group = vim.api.nvim_create_augroup('LspKeymaps', {}),
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
    end,
}
