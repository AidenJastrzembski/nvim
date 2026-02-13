return {
    "brenoprata10/nvim-highlight-colors",
    event = "BufReadPre",
    config = function()
        local utils = require("nvim-highlight-colors.utils")
        local original_get_lsp_clients = utils.get_lsp_clients
        utils.get_lsp_clients = function(bufnr, client_name)
            if client_name == "tailwindcss" then
                return {}
            end
            return original_get_lsp_clients(bufnr, client_name)
        end

        require("nvim-highlight-colors").setup({
            render = "virtual",
            enable_tailwind = true,
        })
    end
}
