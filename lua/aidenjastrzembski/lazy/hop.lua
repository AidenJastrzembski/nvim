return {
    'smoka7/hop.nvim',
    version = "*",
    opts = {
        keys = 'abcdefghijklmnopqrstuvwxyz'
    },
    keys = {
        { "gw", function() require("hop").hint_words() end, desc = "Hop to word" },
    }
}
