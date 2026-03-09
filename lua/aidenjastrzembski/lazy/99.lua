-- TODO: eventually this will be able to replace the completion engine
-- as well, and also should swap to blink probably
return {
    "ThePrimeagen/99",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
        {
            "<leader>9s",
            function() require("99").search() end,
            desc = "99 search",
        },
        {
            "<leader>9v",
            function() require("99").visual() end,
            mode = "v",
            desc = "99 visual",
        },
        {
            "<leader>9x",
            function() require("99").stop_all_requests() end,
            desc = "99 stop all requests",
        },
    },
    config = function()
        local _99 = require("99")
        local hostname = vim.uv.os_gethostname()

        if hostname == "work-mac" then
            _99.setup({
                provider = _99.Providers.ClaudeCodeProvider,
            })
        else
            local BaseProvider = _99.Providers.BaseProvider
            local OllamaProvider = setmetatable({}, { __index = BaseProvider })

            function OllamaProvider._get_provider_name()
                return "OllamaProvider"
            end

            function OllamaProvider._get_default_model()
                return "qwen2.5-coder:14b"
            end

            function OllamaProvider.fetch_models(callback)
                callback({
                    "qwen2.5-coder:14b",
                    "qwen2.5-coder:7b",
                    "qwen2.5-coder:1.5b",
                }, nil)
            end

            function OllamaProvider:_build_command(query, context)
                local payload = vim.json.encode({
                    model = context.model,
                    prompt = query,
                    stream = false,
                })

                local payload_file = context.tmp_file .. "-payload"
                local f = io.open(payload_file, "w")
                if f then
                    f:write(payload)
                    f:close()
                end

                return {
                    "sh",
                    "-c",
                    string.format(
                        "curl -s 'http://eva01:11434/api/generate' -d @'%s' | jq -r '.response' | grep -v '^```' | tee '%s'",
                        payload_file,
                        context.tmp_file
                    ),
                }
            end

            _99.setup({
                provider = OllamaProvider,
                model = "qwen2.5-coder:14b",
            })
        end
    end,
}
