return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "stevearc/conform.nvim",
        "williamboman/mason.nvim",
        { "williamboman/mason-lspconfig.nvim", version = "v1.32.0" },
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/nvim-cmp",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
        "j-hui/fidget.nvim",
    },

    config = function()
        require("conform").setup({
            formatters_by_ft = {
                typescript = { "prettier" },
                typescriptreact = { "prettier" },
                javascript = { "prettier" },
                javascriptreact = { "prettier" },
                rust = { "rustfmt" },
                go = { "gofmt" },
                python = { "black" },
            },
            formatters = {
                black = {
                    prepend_args = { "--fast" }
                }
            },
            format_on_save = {
                timeout_ms = 500,
                lsp_fallback = true,
            },
        })

        local cmp = require('cmp')
        local cmp_lsp = require("cmp_nvim_lsp")
        local capabilities = vim.tbl_deep_extend(
            "force",
            {},
            vim.lsp.protocol.make_client_capabilities(),
            cmp_lsp.default_capabilities())

        require("fidget").setup({})
        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = {
                "rust_analyzer",
                "clangd",
                "zls",
                "gopls",
                "ts_ls",
                "eslint",
                "tailwindcss",
                "pyright",
                "lua_ls",
            },
            handlers = {
                -- Default handler - auto-setup ALL servers
                function(server_name)
                    vim.lsp.config(server_name, {
                        capabilities = capabilities,
                    })
                    vim.lsp.enable(server_name)
                end,

                -- Lua configuration - recognize vim global
                ["lua_ls"] = function()
                    vim.lsp.config("lua_ls", {
                        capabilities = capabilities,
                        settings = {
                            Lua = {
                                diagnostics = {
                                    globals = { "vim" },  -- Recognize 'vim' global
                                },
                                workspace = {
                                    library = vim.api.nvim_get_runtime_file("", true),
                                    checkThirdParty = false,
                                },
                                telemetry = {
                                    enable = false,
                                },
                            },
                        },
                    })
                    vim.lsp.enable("lua_ls")
                end,

                -- Custom Rust configuration
                ["rust_analyzer"] = function()
                    vim.lsp.config("rust_analyzer", {
                        capabilities = capabilities,
                        settings = {
                            ["rust-analyzer"] = {
                                cargo = { 
                                    allFeatures = true 
                                },
                                diagnostics = {
                                    enable = true,
                                },
                                inlayHints = {
                                    lifetimeElisionHints = {
                                        enable = "always",
                                    },
                                },
                                checkOnSave = {
                                    command = "clippy",
                                },
                            },
                        },
                    })
                    vim.lsp.enable("rust_analyzer")
                end,
            }
        })

        local cmp_select = { behavior = cmp.SelectBehavior.Select }

        cmp.setup({
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body)
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ['<S-Tab>'] = cmp.mapping.select_prev_item(cmp_select),
                ['<Tab>'] = cmp.mapping.select_next_item(cmp_select),
                ['<CR>'] = cmp.mapping.confirm({ select = true }), --Enter, this could get annoying tho
                ["<C-p>"] = cmp.mapping.complete(),
            }),
            sources = cmp.config.sources({
                { name = 'nvim_lsp' },
                { name = 'luasnip' },
            }, {
                { name = 'buffer' },
            })
        })

        vim.diagnostic.config({
            virtual_text = true,
            signs = true,
            underline = true,
            update_in_insert = true,
            severity_sort = true,
            float = {
                focusable = false,
                style = "minimal",
                border = "rounded",
                source = "always",
                header = "",
                prefix = "",
            },
        })
    end
}
